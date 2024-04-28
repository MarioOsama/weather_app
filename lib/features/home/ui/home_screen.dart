import 'package:flutter/material.dart';
import 'package:weather_app/features/home/ui/widgets/background_image.dart';
import 'package:weather_app/features/home/ui/widgets/custom_draggable_modal_bottom_sheet.dart';
import 'package:weather_app/features/home/ui/widgets/house_item.dart';
import 'package:weather_app/features/home/ui/widgets/day_weather_summary.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isNight = _getDayOrNight();
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          BackgroundImage(
            isNight: isNight,
          ),
          DayWeatherSummary(
            isNight: isNight,
          ),
          const HouseItem(),
          const CustomDraggableModalBottomSheet(),
        ],
      ),
    );
  }

  bool _getDayOrNight() => DateTime.now().hour >= 18 || DateTime.now().hour < 6;
}
