import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/app_string.dart';
import 'package:weather_app/core/helpers/extensions.dart';
import 'package:weather_app/core/helpers/spacing.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/core/widgets/custom_app_bar.dart';
import 'package:weather_app/core/widgets/custom_text_field.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/search/data/models/city_weather_response_body.dart';
import 'package:weather_app/features/search/logic/cubit/search_cubit.dart';
import 'package:weather_app/features/search/logic/cubit/search_state.dart';
import 'package:weather_app/features/search/ui/widgets/search_error_bloc_listener.dart';
import 'package:weather_app/features/search/ui/widgets/search_result_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.currentWeather,
  });

  final CurrentWeatherResponseBody currentWeather;

  @override
  Widget build(BuildContext context) {
    // Setup the search screen with the current city weather
    SearchCubit searchCubit = context.read<SearchCubit>();
    searchCubit.setupSearch(currentWeather);

    // Get the language of the device
    final String language = context.locale.languageCode;
    return Scaffold(
        body: Container(
      decoration: _buildDecoration(),
      child: Column(
        children: <Widget>[
          CustomAppBar(
            title: AppStrings.search.tr(),
            backIcon:
                language == 'ar' ? Icons.keyboard_arrow_right_outlined : null,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
            child: CustomTextField(
              onSearch: () =>
                  context.read<SearchCubit>().validateThenSearch(language),
            ),
          ),
          verticalSpace(20),
          GestureDetector(
            onTap: () {
              final SearchState state = context.read<SearchCubit>().state;
              // Check if the search state is loaded to avoid unnecessary processing
              if (state is SearchLoaded) {
                confirmNewCity(context);
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: SearchResultCard(index: 1.0),
            ),
          ),
          const SearchErrorBlocListener(),
        ],
      ),
    ));
  }

  BoxDecoration _buildDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.primaryColor,
          AppColors.secondaryColor,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  void confirmNewCity(BuildContext context) {
    final SearchState state = context.read<SearchCubit>().state;
    final CityWeatherResponseBody? cityWeather = state.searchResult;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(AppStrings.changeLocation.tr(),
            style: AppTextStyles.font20WhiteRegular),
        content: Text(AppStrings.changeRegion.tr(),
            style: AppTextStyles.font16GreyMedium),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.pop();
              context.pop(cityWeather!.cityName);
            },
            child: Text(
              AppStrings.ok.tr(),
              style: AppTextStyles.font13WhiteSemiBold,
            ),
          ),
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              AppStrings.cancel.tr(),
              style: AppTextStyles.font13WhiteSemiBold,
            ),
          ),
        ],
        backgroundColor: AppColors.secondaryGradientColorOne,
      ),
    );
  }
}
