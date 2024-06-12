import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    super.key,
    required this.message,
    this.icon,
  });

  final String message;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final isIconExist = icon != null;
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.2,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            AppColors.secondaryGradientColorTwo,
            AppColors.secondaryGradientColorOne,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIconExist
              ? icon!
              : const SpinKitSpinningLines(
                  color: Colors.white,
                  size: 50.0,
                ),
          const SizedBox(height: 20),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              message,
              style: AppTextStyles.font20WhiteRegular,
            ),
          ),
        ],
      ),
    );
  }
}
