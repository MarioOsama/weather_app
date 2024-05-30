import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    // log(unixToTime(1717001410));
    // log(getSunriseSunsetPercentage(1716951303, 1717001410).toString());
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
  return [
    WeatherDetailsItemModel(
        icon: Icons.sunny_snowing,
        title: 'SUNRISE',
        subtitle: '${unixToTime(currentWeather.sunrise)} AM',
        barPercentage: getSunriseSunsetPercentage(
            currentWeather.sunrise, currentWeather.sunset),
        footerText: 'SUNSET: ${unixToTime(currentWeather.sunset)}PM'),
    WeatherDetailsItemModel(
      icon: Icons.wind_power,
      title: 'WIND',
      subtitle: '${currentWeather.windSpeed} km/h',
      footerText: 'Direction: ${currentWeather.windDeg}°',
    ),
    WeatherDetailsItemModel(
      icon: Icons.thermostat_outlined,
      title: 'FEEELS LIKE',
      subtitle: currentWeather.feelsLike.toInt().toString(),
      footerText: (currentWeather.temp - currentWeather.feelsLike).round() > 0
          ? 'The difference is ${(currentWeather.temp - currentWeather.feelsLike).round()}°C'
          : 'Similar to the actual temperature',
    ),
    WeatherDetailsItemModel(
      icon: Icons.water,
      title: 'HUMIDITY',
      subtitle: '${currentWeather.humidity.toInt()}%',
      barPercentage: currentWeather.humidity / 100,
    ),
    WeatherDetailsItemModel(
      icon: Icons.heat_pump_sharp,
      title: 'PRESSURE',
      subtitle: '${currentWeather.pressure.toInt()} hPa',
    ),
  ];
}
