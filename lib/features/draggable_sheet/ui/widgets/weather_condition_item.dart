import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/core/theming/app_assets.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weather_condition_item_model.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/animated_picture.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/non_animated_picture.dart';

class WeatherConditionItem extends StatelessWidget {
  const WeatherConditionItem({
    super.key,
    required this.weatherConditionItemModel,
  });

  final WeatherConditionItemModel weatherConditionItemModel;

  @override
  Widget build(BuildContext context) {
    final bool isNow = weatherConditionItemModel.time == DateTime.now().hour;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      height: 150,
      width: 60,
      decoration: _buildDecoration(isNow),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              isNow ? 'Now' : '${weatherConditionItemModel.time} AM',
              style: AppTextStyles.font15WhiteSemiBold,
            ),
          ),
          Expanded(
            child: isNow
                ? const AnimatedPicture(
                    assetName: Assets.imagesSvgsMoonCloudMidRain,
                  )
                : const SvgAssetImage(
                    assetName: Assets.imagesSvgsMoonCloudMidRain),
          ),
          Text(
            '${weatherConditionItemModel.temp}°',
            style: AppTextStyles.font20WhiteRegular,
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration(bool isNow) {
    return BoxDecoration(
      color: AppColors.secondaryColor.withOpacity(isNow ? 1 : 0.2),
      border: Border.all(
        color: AppColors.greyColor.withOpacity(isNow ? 0.5 : 0.25),
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
