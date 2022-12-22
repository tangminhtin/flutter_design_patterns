import 'package:flutter/material.dart';

class FadeSlideTransition extends StatelessWidget {
  final AnimationController controller;
  final Tween slideAnimationTween;
  final Widget child;
  final double begin;
  final double end;
  final int? index;
  final double? singleItemDurationInterval;

  const FadeSlideTransition({
    super.key,
    required this.controller,
    required this.slideAnimationTween,
    required this.child,
    this.begin = 0.0,
    this.end = 1.0,
    this.index,
    this.singleItemDurationInterval,
  });

  const FadeSlideTransition.staggered({
    super.key,
    required this.controller,
    required this.slideAnimationTween,
    required this.child,
    this.begin = 0.0,
    this.end = 1.0,
    required this.index,
    required this.singleItemDurationInterval,
  })  : assert(index != null),
        assert(singleItemDurationInterval != null);

  double get _begin => index != null && singleItemDurationInterval != null
      ? _calculateBegin()
      : begin;

  double get _end => index != null && singleItemDurationInterval != null
      ? _calculateEnd()
      : end;

  double _calculateBegin() {
    final delay = (singleItemDurationInterval! * index!).toDouble();

    return begin + delay < 1.0
        ? begin + delay
        : 1.0 - singleItemDurationInterval!;
  }

  double _calculateEnd() {
    final delay = (singleItemDurationInterval! * index!).toDouble();

    return begin + delay + singleItemDurationInterval! < end
        ? begin + delay + singleItemDurationInterval!
        : end;
  }

  Animation<double> get _fadeAnimation => Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            _begin,
            _end,
            curve: Curves.ease,
          ),
        ),
      );

  Animation<Offset> get _slideAnimation =>
      (slideAnimationTween as Tween<Offset>).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            _begin,
            _end,
            curve: Curves.ease,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: child,
      ),
    );
  }
}
