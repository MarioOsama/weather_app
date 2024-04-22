import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_assets.dart';
import 'package:weather_app/features/home/ui/widgets/custom_draggable_modal_bottom_sheet.dart';
import 'package:weather_app/features/home/ui/widgets/house_item.dart';
import 'package:weather_app/features/home/ui/widgets/info_summary.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Image.asset(Assets.imagesPngsHomeMorningBg),
          const InformationSummary(),
          const HouseItem(),
          const CustomDraggableModalBottomSheet(),
        ],
      ),
    );
  }
}
