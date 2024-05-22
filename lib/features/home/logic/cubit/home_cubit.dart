import 'package:bloc/bloc.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial(true));

  void hideHome() {
    emit(const HomeHidden());
  }

  void displayHome() {
    emit(const HomeInitial(true));
  }

  void loading(String forecastType) {
    forecastType = getForecastType(forecastType);
    if (forecastType == 'Hourly') {
      emit(const HomeInitial(true));
    } else if (forecastType == 'Weekly') {
      emit(const HomeInitial(false));
    }
  }

  String getForecastType(String forecastType) =>
      forecastType.replaceAll(' Forecast', '');
}
