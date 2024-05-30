import 'package:flutter/material.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/non_animated_picture.dart';

class AnimatedPicture extends StatefulWidget {
  const AnimatedPicture({
    super.key,
    required this.assetName,
  });

  final String assetName;

  @override
  State<AnimatedPicture> createState() => _AnimatedPictureState();
}

class _AnimatedPictureState extends State<AnimatedPicture>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity:
            Tween<double>(begin: 0.25, end: 1).animate(animationController),
        child: SvgAssetImage(
          assetName: widget.assetName,
        ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
