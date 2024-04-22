import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_assets.dart';

class HouseItem extends StatelessWidget {
  const HouseItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 190,
      child: Image.asset(
        Assets.imagesPngsHouse,
      ),
    );
  }
}
