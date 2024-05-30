import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';

class SheetHeaderActionButton extends StatelessWidget {
  const SheetHeaderActionButton({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected) return;
        context.read<HomeCubit>().toggleForecastType(title);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding:
            isSelected ? EdgeInsets.zero : const EdgeInsets.only(bottom: 3.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: isSelected ? 3.0 : 0.0,
            ),
          ),
        ),
        child: Text(
          '$title Forecast',
          style: AppTextStyles.font16GreyMedium,
        ),
      ),
    );
  }
}
