import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  const BounceAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation sizeAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    sizeAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.8),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.8, end: 1.0),
        weight: 1,
      ),
    ]).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: sizeAnimation.value,
      child: widget.child,
    );
  }
}
