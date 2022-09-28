import 'package:flutter/material.dart';

class VerticalSlidingAnimation extends StatelessWidget {
  const VerticalSlidingAnimation({
    super.key,
    required this.child,
    this.begin = -500.0,
    this.duration = const Duration(seconds: 3),
  });
  final Widget child;
  final double begin;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.easeInOutBack,
      tween: Tween<double>(begin: begin, end: 0.0),
      duration: duration,
      builder: (context, double value, _) {
        return Transform(
          transform: Matrix4.translationValues(0, value, 0),
          child: child,
        );
      },
    );
  }
}
