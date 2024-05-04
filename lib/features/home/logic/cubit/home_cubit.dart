import 'package:bloc/bloc.dart';
import 'package:weather_app/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void hideHome() {
    emit(const HomeHidden());
  }

  void displayHome() {
    emit(const HomeInitial());
  }
}
