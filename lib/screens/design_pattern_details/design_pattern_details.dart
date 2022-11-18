import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/data/models/design_pattern.dart';
import 'package:flutter_design_patterns/data/repositories/markdown_repository.dart';
import 'package:flutter_design_patterns/screens/design_pattern_details/widgets/design_pattern_details_header.dart';
import 'package:flutter_design_patterns/widgets/fade_slide_transition.dart';
import 'package:flutter_design_patterns/widgets/platform_back_button.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DesignPatternDetails extends StatefulWidget {
  final DesignPattern designPattern;
  final Widget example;

  const DesignPatternDetails({
    super.key,
    required this.designPattern,
    required this.example,
  });

  @override
  State<DesignPatternDetails> createState() => _DesignPatternDetailsState();
}

class _DesignPatternDetailsState extends State<DesignPatternDetails>
    with TickerProviderStateMixin {
  final MarkdownRepository repository = MarkdownRepository();

  final double _contentAnimationIntervalStart = 0.65;
  final double _preferredAppBarHeight = 56.0;

  AnimationController? _fadeSlideAnimationController;
  ScrollController? _scrollController;
  TabController? _tabController;
  double _appBarElevation = 0.0;
  double _appBarTitleOpacity = 0.0;
  double _bottomNavigationBarElevation = 4.0;

  @override
  void initState() {
    super.initState();

    _fadeSlideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _appBarElevation =
              _scrollController!.offset > _scrollController!.initialScrollOffset
                  ? 4.0
                  : 0.0;

          _appBarTitleOpacity = _scrollController!.offset >
                  _scrollController!.initialScrollOffset +
                      _preferredAppBarHeight / 2
              ? 1.0
              : 0.0;

          _bottomNavigationBarElevation = _scrollController!.offset ==
                  _scrollController!.position.maxScrollExtent
              ? 0.0
              : 4.0;
        });
      });

    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _fadeSlideAnimationController!.dispose();
    _scrollController!.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  void onBottomNavigationBarItemTap(int index) {
    setState(() {
      _tabController!.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FadeSlideTransition(
        controller: _fadeSlideAnimationController!,
        slideAnimationTween: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: const Offset(0.0, 0.0),
        ),
        begin: _contentAnimationIntervalStart,
        end: 1.0,
        child: BottomNavigationBar(
          currentIndex: _tabController!.index,
          backgroundColor: lightBackgroundColor,
          elevation: _bottomNavigationBarElevation,
          selectedIconTheme: const IconThemeData(size: 20.0),
          selectedItemColor: Colors.black,
          unselectedIconTheme: const IconThemeData(size: 20.0),
          unselectedItemColor: Colors.black45,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.fileLines),
              label: 'Description',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.lightbulb),
              label: 'Example',
            ),
          ],
          onTap: onBottomNavigationBarItemTap,
        ),
      ),
      body: Stack(
        children: [
          Hero(
            tag: '${widget.designPattern.id}_background',
            child: Container(
              color: lightBackgroundColor,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                FadeSlideTransition(
                  controller: _fadeSlideAnimationController!,
                  slideAnimationTween: Tween<Offset>(
                    begin: const Offset(0.0, 0.5),
                    end: const Offset(0.0, 0.0),
                  ),
                  begin: 0.0,
                  end: _contentAnimationIntervalStart,
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(_preferredAppBarHeight),
                    child: AppBar(
                      title: AnimatedOpacity(
                        opacity: _appBarTitleOpacity,
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          widget.designPattern.title,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      backgroundColor: lightBackgroundColor,
                      elevation: _appBarElevation,
                      leading: const PlatformBackButton(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ScrollConfiguration(
                        behavior: const ScrollBehavior(),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          padding: const EdgeInsets.fromLTRB(
                            paddingL,
                            paddingZero,
                            paddingL,
                            paddingL,
                          ),
                          child: Column(
                            children: [
                              FadeSlideTransition(
                                controller: _fadeSlideAnimationController!,
                                slideAnimationTween: Tween<Offset>(
                                  begin: const Offset(0.0, 0.25),
                                  end: const Offset(0.0, 0.0),
                                ),
                                child: DesignPatternDetailsHeader(
                                  designPattern: widget.designPattern,
                                ),
                              ),
                              const SizedBox(height: spacingL),
                              FadeSlideTransition(
                                controller: _fadeSlideAnimationController!,
                                slideAnimationTween: Tween<Offset>(
                                  begin: const Offset(0.0, 0.05),
                                  end: const Offset(0.0, 0.0),
                                ),
                                begin: _contentAnimationIntervalStart,
                                end: 1.0,
                                child: FutureBuilder(
                                  future:
                                      repository.get(widget.designPattern.id),
                                  initialData: "",
                                  builder: (_, AsyncSnapshot<String> snapshot) {
                                    if (snapshot.data != null) {
                                      return MarkdownBody(
                                        data: snapshot.data!,
                                      );
                                    }

                                    return CircularProgressIndicator(
                                      backgroundColor: lightBackgroundColor,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.black.withOpacity(0.65),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      widget.example,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
