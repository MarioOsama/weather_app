import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/dependency_injection.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_cubit.dart';
import 'package:weather_app/features/draggable_sheet/ui/draggable_sheet.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';
import 'package:weather_app/features/home/ui/widgets/background_image.dart';
import 'package:weather_app/features/home/ui/widgets/house_item.dart';
import 'package:weather_app/features/home/ui/widgets/day_weather_summarization.dart';
import 'package:weather_app/features/home/ui/widgets/loading_container.dart';
import 'package:weather_app/features/home/ui/widgets/search_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Loading hourly data
    context.read<HomeCubit>().loadWeatherData('Hourly');
    // Check if it is night or day
    final bool isNight = _getDayOrNight();
    return Scaffold(
      backgroundColor: AppColors.primaryGradientColorOne,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final bool isHomeHidden = state.isHomeSheetExpanded;
          if (state is HomeLoading) {
            return _buildLoadingHome(isNight);
          }

          return _buildLoadedHome(isHomeHidden, isNight, context);
        },
      ),
    );
  }

  Stack _buildLoadingHome(bool isNight) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.25,
          child: BackgroundImage(
            isNight: isNight,
          ),
        ),
        const Center(
          child: LoadingContainer(
            message: 'Get the weather data',
          ),
        ),
      ],
    );
  }

  Stack _buildLoadedHome(bool isHidden, bool isNight, BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        if (!isHidden)
          BackgroundImage(
            isNight: isNight,
          ),
        if (!isHidden)
          Positioned(
            width: MediaQuery.sizeOf(context).width * 1.05,
            bottom: MediaQuery.sizeOf(context).height * 0.15,
            child: const HouseItem(),
          ),
        Positioned(
          left: 10,
          top: 50,
          child: SearchIcon(
            color: isNight || isHidden
                ? Colors.white
                : AppColors.secondaryGradientColorTwo,
          ),
        ),
        DayWeatherSummarization(
          isNight: isNight,
        ),
        BlocProvider<SheetCubit>(
          create: (context) => getIt<SheetCubit>(),
          child: const DraggableSheet(),
        ),
      ],
    );
  }

  bool _getDayOrNight() => DateTime.now().hour >= 18 || DateTime.now().hour < 6;
}
