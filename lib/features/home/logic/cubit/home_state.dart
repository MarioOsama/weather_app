abstract class HomeState {
  const HomeState();

  // final bool? isHourlyForecast;
}

class HomeInitial extends HomeState {
  final bool isHourlyForecast;
  const HomeInitial(this.isHourlyForecast);
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

// class HomeLoaded extends HomeState {
//   const HomeLoaded(this.weather);

//   final Weather weather;

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is HomeLoaded &&
//       other.weather == weather;
//   }

//   @override
//   int get hashCode => weather.hashCode;
// }

class HomeError extends HomeState {
  const HomeError(
    this.message,
  );

  final String message;
}

class HomeNoInternet extends HomeState {
  const HomeNoInternet();
}

class HomeNoLocation extends HomeState {
  const HomeNoLocation();
}

class HomeHidden extends HomeState {
  const HomeHidden();
}
