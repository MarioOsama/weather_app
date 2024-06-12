import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/app_string.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class HomeErrorBlocListener extends StatelessWidget {
  const HomeErrorBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => current is HomeError,
      listener: (context, state) {
        if (state is HomeError) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(AppStrings.error.tr(),
                  style: AppTextStyles.font20WhiteRegular),
              content: Text(
                state.failure.message.tr(),
                style: AppTextStyles.font16GreyMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(AppStrings.ok.tr(),
                      style: AppTextStyles.font13WhiteSemiBold),
                )
              ],
              backgroundColor: AppColors.secondaryGradientColorOne,
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
