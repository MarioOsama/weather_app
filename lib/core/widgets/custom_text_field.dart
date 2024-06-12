import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/app_string.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/search/logic/cubit/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.onSearch,
  });

  final void Function() onSearch;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _searchController;

  @override
  initState() {
    super.initState();
    _searchController = context.read<SearchCubit>().searchController;
  }

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
        controller: _searchController,
        style: AppTextStyles.font20WhiteRegular,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          hintText: AppStrings.enterCityName.tr(),
          hintStyle: AppTextStyles.font18GreyRegular,
          suffixIcon: GestureDetector(
            onTap: widget.onSearch,
            child: const Icon(
              Icons.search,
              color: AppColors.greyColor,
            ),
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

  @override
  dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
