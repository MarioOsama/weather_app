import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return Scaffold(
        body: Container(
      decoration: _buildDecoration(),
      child: Column(
        children: <Widget>[
          const CustomAppBar(title: 'Search'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
            child: CustomTextField(),
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
        title: const Text('Change Location',
            style: AppTextStyles.font20WhiteRegular),
        content: const Text(
            'Are you sure to change the weather condition to this region?',
            style: AppTextStyles.font16GreyMedium),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.pop();
              context.pop(cityWeather!.cityName);
            },
            child: const Text(
              'OK',
              style: AppTextStyles.font13WhiteSemiBold,
            ),
          ),
          TextButton(
            onPressed: () => context.pop(),
            child: const Text(
              'Cancel',
              style: AppTextStyles.font13WhiteSemiBold,
            ),
          ),
        ],
        backgroundColor: AppColors.secondaryGradientColorOne,
      ),
    );
  }
}
