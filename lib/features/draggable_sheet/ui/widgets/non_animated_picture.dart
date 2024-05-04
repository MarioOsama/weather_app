import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAssetImage extends StatelessWidget {
  const SvgAssetImage({
    super.key,
    required this.assetName,
  });

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
    );
  }
}
