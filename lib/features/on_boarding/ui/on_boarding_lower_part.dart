import 'package:flutter/material.dart';
import 'package:weather_app/features/on_boarding/ui/on_boarding_lower_part_button.dart';
import 'package:weather_app/features/on_boarding/ui/on_boarding_lower_part_texts.dart';

class OnBoardingLowerPart extends StatelessWidget {
  const OnBoardingLowerPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OnBoardingLowerPartTexts(),
          Spacer(),
          OnBoardingLowerPartButton(),
        ],
      ),
    );
  }
}
