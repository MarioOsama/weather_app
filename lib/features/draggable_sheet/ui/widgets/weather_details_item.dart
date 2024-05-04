import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weather_details_item_model.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_cubit.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_state.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/percentage_bar.dart';

class WeatherDetailsItem extends StatelessWidget {
  const WeatherDetailsItem({
    super.key,
    this.subtitleStyle,
    required this.weatherDetailsItemModel,
  });

  final WeatherDetailsItemModel weatherDetailsItemModel;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SheetCubit, SheetState, double>(
      selector: (state) => state.sheetSize ?? 0.37,
      builder: (context, size) {
        return AnimatedScale(
          duration: const Duration(milliseconds: 100),
          scale: size + 0.17,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: AppColors.lightPurpleColor,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      weatherDetailsItemModel.icon,
                      color: AppColors.greyColor,
                      size: 24,
                    ),
                    horizontalSpace(5),
                    Text(
                      weatherDetailsItemModel.title,
                      style: AppTextStyles.font16GreyMedium,
                    ),
                  ],
                ),
                verticalSpace(10),
                Text(
                  weatherDetailsItemModel.subtitle,
                  style: subtitleStyle ?? AppTextStyles.font24WhiteSemiBold,
                ),
                verticalSpace(20),
                if (weatherDetailsItemModel.barPercentage != null)
                  PercentageBar(
                    percentage: weatherDetailsItemModel.barPercentage!,
                  ),
                if (weatherDetailsItemModel.barPercentage != null &&
                    weatherDetailsItemModel.footerText != null)
                  verticalSpace(20),
                if (weatherDetailsItemModel.footerText != null)
                  Text(
                    weatherDetailsItemModel.footerText!,
                    style: AppTextStyles.font16GreyMedium,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
