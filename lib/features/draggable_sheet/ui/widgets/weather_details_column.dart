import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/app_string.dart';
import 'package:weather_app/core/helpers/date_time.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/app_text_styles.dart';
import 'package:weather_app/features/draggable_sheet/data/models/weather_details_item_model.dart';
import 'package:weather_app/features/draggable_sheet/ui/widgets/weather_details_item.dart';
import 'package:weather_app/features/home/data/models/current_weather_response_body.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class WeatherDetailsColumn extends StatelessWidget {
  const WeatherDetailsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentWeather =
        (context.read<HomeCubit>().state as HomeLoaded).currentWeather;
    final weatherDetailsModels = getWeatherDetailsModelList(currentWeather);
    return Column(
      children: <Widget>[
        WeatherDetailsItem(
          weatherDetailsItemModel: weatherDetailsModels[0],
          subtitleStyle: AppTextStyles.font20WhiteSemiBold,
          barGradientColors: const [
            AppColors.blueColor,
            AppColors.pinkColor,
            AppColors.blueColor,
          ],
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: weatherDetailsModels.length - 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) => WeatherDetailsItem(
            weatherDetailsItemModel: weatherDetailsModels[index + 1],
          ),
        ),
      ],
    );
  }
}

List<WeatherDetailsItemModel> getWeatherDetailsModelList(
    CurrentWeatherResponseBody currentWeather) {
  log((currentWeather.temp.round() - currentWeather.feelsLike.round())
      .abs()
      .toString());
  return [
    WeatherDetailsItemModel(
        icon: Icons.sunny_snowing,
        title: AppStrings.sunrise.tr(),
        subtitle: '${unixToTime(currentWeather.sunrise)} ${AppStrings.am.tr()}',
        barPercentage: getSunriseSunsetPercentage(
            currentWeather.sunrise, currentWeather.sunset),
        footerText:
            '${AppStrings.sunset.tr()}: ${unixToTime(currentWeather.sunset)} ${AppStrings.pm.tr()}'),
    WeatherDetailsItemModel(
      icon: Icons.wind_power,
      title: AppStrings.wind.tr(),
      subtitle: '${currentWeather.windSpeed} ${AppStrings.kmH.tr()}',
      footerText: '${AppStrings.direction.tr()}: ${currentWeather.windDeg}°',
    ),
    WeatherDetailsItemModel(
      icon: Icons.thermostat_outlined,
      title: AppStrings.feelsLike.tr(),
      subtitle: currentWeather.feelsLike.round().toString(),
      footerText: (currentWeather.temp.round() -
                      currentWeather.feelsLike.round())
                  .abs() >
              0
          ? '${AppStrings.theDifferenceIs.tr()} ${currentWeather.temp.round() - currentWeather.feelsLike.round()}°C'
          : AppStrings.similarToTheActualTemperature.tr(),
    ),
    WeatherDetailsItemModel(
      icon: Icons.water,
      title: AppStrings.humidity.tr(),
      subtitle: '${currentWeather.humidity.toInt()}%',
      barPercentage: currentWeather.humidity / 100,
    ),
    WeatherDetailsItemModel(
      icon: Icons.heat_pump_sharp,
      title: AppStrings.pressure.tr(),
      subtitle: '${currentWeather.pressure.toInt()} hPa',
    ),
  ];
}
