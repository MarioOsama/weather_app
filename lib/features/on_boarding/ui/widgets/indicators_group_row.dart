import 'package:flutter/material.dart';
import 'package:weather_app/features/on_boarding/ui/widgets/page_indicator.dart';

class IndicatorsGroupRow extends StatelessWidget {
  final int activeIndex;
  const IndicatorsGroupRow({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          4, (index) => PageIndicator(isActive: index == activeIndex)),
    );
  }
}
