// Convert UNIX timestamp to DateTime
String unixToTime(int unix) {
  final DateTime unixDate = DateTime.fromMillisecondsSinceEpoch(unix * 1000)
      .add(const Duration(hours: 1));
  final int hour = unixDate.hour % 12;
  return '$hour:${unixDate.minute}';
}

double getSunriseSunsetPercentage(int sunrise, int sunset) {
  final DateTime now = DateTime.now();
  final DateTime sunriseDate =
      DateTime.fromMillisecondsSinceEpoch(sunrise * 1000)
          .add(const Duration(hours: 1));
  final DateTime sunsetDate = DateTime.fromMillisecondsSinceEpoch(sunset * 1000)
      .add(const Duration(hours: 1));
  final int totalMinutes = sunsetDate.difference(sunriseDate).inMinutes;
  final int passedMinutes = now.difference(sunriseDate).inMinutes;
  return passedMinutes / totalMinutes;
}
