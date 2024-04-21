import 'package:flutter/material.dart';

class OnBoardingUpperPartImage extends StatefulWidget {
  const OnBoardingUpperPartImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  State<OnBoardingUpperPartImage> createState() =>
      _OnBoardingUpperPartImageState();
}

class _OnBoardingUpperPartImageState extends State<OnBoardingUpperPartImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String? oldImage;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    oldImage = widget.image;
  }

  @override
  void didUpdateWidget(covariant OnBoardingUpperPartImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.image != widget.image) {
      oldImage = oldWidget.image;
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: FadeTransition(
        opacity: _animation,
        child: Image.asset(widget.image),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
