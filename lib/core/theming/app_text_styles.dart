import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle font15WhiteSemiBold = TextStyle(
    fontSize: 15,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle font16GreySemiBold = TextStyle(
    fontSize: 16,
    color: AppColors.greyColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle font20WhiteRegular = TextStyle(
    fontSize: 20,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle font13WhiteSemiBold = TextStyle(
    fontSize: 13,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle font34WhiteSemiBold = TextStyle(
    fontSize: 34,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
  );
}
