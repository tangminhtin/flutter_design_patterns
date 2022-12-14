import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/data/models/design_pattern_category.dart';
import 'package:flutter_design_patterns/screens/category/widgets/design_pattern_card.dart';
import 'package:flutter_design_patterns/widgets/coming_soon.dart';
import 'package:flutter_design_patterns/widgets/fade_slide_transition.dart';
import 'package:flutter_design_patterns/widgets/platform_back_button.dart';

class Category extends StatefulWidget {
  final DesignPatternCategory category;

  const Category({
    super.key,
    required this.category,
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  final double _listAnimationIntervalStart = 0.65;
  final double _preferredAppBarHeight = 56.0;

  AnimationController? _fadeSlideAnimationController;
  ScrollController? _scrollController;
  double _appBarElevation = 0.0;
  double _appBarTitleOpacity = 0.0;

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
        });
      });
  }

  @override
  void dispose() {
    _fadeSlideAnimationController!.dispose();
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: '${widget.category.id}_bakground',
            child: Container(
              color: Color(widget.category.color),
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
                  end: _listAnimationIntervalStart,
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(_preferredAppBarHeight),
                    child: AppBar(
                      title: AnimatedOpacity(
                        opacity: _appBarTitleOpacity,
                        duration: const Duration(milliseconds: 250),
                        child: Text(widget.category.title),
                      ),
                      backgroundColor: Color(widget.category.color),
                      elevation: _appBarElevation,
                      leading: const PlatformBackButton(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
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
                              begin: const Offset(0.0, 0.5),
                              end: const Offset(0.0, 0.0),
                            ),
                            begin: 0.0,
                            end: _listAnimationIntervalStart,
                            child: Row(
                              children: [
                                Text(
                                  widget.category.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 32.0,
                                        color: Colors.white,
                                      ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: spacingL),
                          for (var i = 0;
                              i < widget.category.patterns.length;
                              i++)
                            FadeSlideTransition.staggered(
                              controller: _fadeSlideAnimationController!,
                              slideAnimationTween: Tween<Offset>(
                                begin: const Offset(0.0, 0.1),
                                end: const Offset(0.0, 0.0),
                              ),
                              begin: _listAnimationIntervalStart,
                              end: 1.0,
                              index: i,
                              singleItemDurationInterval: 0.05,
                              child: Container(
                                margin: const EdgeInsets.only(top: marginL),
                                child: DesignPatternCard(
                                  designPattern: widget.category.patterns[i],
                                ),
                              ),
                            ),
                          if (widget.category.patterns.isEmpty)
                            FadeSlideTransition(
                              controller: _fadeSlideAnimationController!,
                              slideAnimationTween: Tween<Offset>(
                                begin: const Offset(0.0, 0.5),
                                end: const Offset(0.0, 0.0),
                              ),
                              begin: 0.0,
                              end: _listAnimationIntervalStart,
                              child: const ComingSoon(),
                            ),
                        ],
                      ),
                    ),
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
