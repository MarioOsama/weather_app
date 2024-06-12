import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/helpers/extensions.dart';
import 'package:weather_app/core/routing/app_routes.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();

    // Get device language
    final String language = context.locale.languageCode;
    return GestureDetector(
      onTap: () async {
        final currentWeather = (homeCubit.state as HomeLoaded).currentWeather;
        final String? cityName = await context.pushNamed(AppRoutes.search,
            arguments: currentWeather);
        if (cityName != null) {
          homeCubit.loadWeatherDataByCityName(cityName, language);
        }
      },
      child: Icon(
        Icons.search,
        color: color,
        size: 30,
      ),
    );
  }
}
