import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/networking/api_services.dart';
import 'package:weather_app/features/draggable_sheet/logic/cubit/sheet_cubit.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';
import 'package:weather_app/features/home/logic/cubit/home_cubit.dart';
import 'package:weather_app/features/on_boarding/cubit/on_boarding_cubit.dart';

import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Cubits
  getIt.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<SheetCubit>(() => SheetCubit());

  // Repos
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
