import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/app_texts.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.blueBlackColor,
            blurRadius: 50,
            offset: Offset(0, -4),
            blurStyle: BlurStyle.inner,
          ),
        ],
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: AppTexts.searchForCity,
          hintStyle: AppTextStyles.font18GreyRegular,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.greyColor,
          ),
          constraints: const BoxConstraints(
            maxHeight: 40,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
