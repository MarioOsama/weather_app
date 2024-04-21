import 'package:get_it/get_it.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Cubits
  getIt.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
}
