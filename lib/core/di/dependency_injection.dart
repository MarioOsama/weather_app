import 'package:get_it/get_it.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_cubit.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Cubits
  getIt.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<SheetCubit>(() => SheetCubit());
}
