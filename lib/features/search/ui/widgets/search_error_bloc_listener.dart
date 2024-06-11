import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/search/logic/cubit/search_cubit.dart';
import 'package:weather_app/features/search/logic/cubit/search_state.dart';

class SearchErrorBlocListener extends StatelessWidget {
  const SearchErrorBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchError) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('Error',
                        style: AppTextStyles.font20WhiteRegular),
                    content: Text(
                      state.failure.message,
                      style: AppTextStyles.font16GreyMedium,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK',
                            style: AppTextStyles.font13WhiteSemiBold),
                      )
                    ],
                    backgroundColor: AppColors.secondaryGradientColorOne,
                  ));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
