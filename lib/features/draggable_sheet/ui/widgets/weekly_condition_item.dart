import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weekly_condition_item_model.dart';

class WeeklyConditionItem extends StatelessWidget {
  const WeeklyConditionItem({
    super.key,
    required this.weeklyConditionItemModel,
  });

  final WeeklyConditionItemModel weeklyConditionItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      height: 150,
      width: 60,
      decoration: _buildDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedBox(
            child: Text(
              weeklyConditionItemModel.getDate,
              style: AppTextStyles.font15WhiteSemiBold,
            ),
          ),
          Text(
            'H: ${weeklyConditionItemModel.highestTemp.round()}°',
            style: AppTextStyles.font13WhiteSemiBold,
          ),
          Text(
            'L: ${weeklyConditionItemModel.lowestTemp.round()}°',
            style: AppTextStyles.font13WhiteSemiBold,
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: AppColors.secondaryColor.withOpacity(0.2),
      border: Border.all(
        color: AppColors.greyColor.withOpacity(0.25),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.blueBlackColor.withOpacity(0.25),
          blurRadius: 15,
          spreadRadius: 3,
          offset: const Offset(1, 1),
        )
      ],
      borderRadius: BorderRadius.circular(30),
    );
  }
}
