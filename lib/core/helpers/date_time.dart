// Convert UNIX timestamp to DateTime
String unixToTime(int unix, int timezone) {
  final DateTime unixDate =
      DateTime.fromMillisecondsSinceEpoch(unix * 1000, isUtc: true);
  final int hour = unixDate.hour % 12 + Duration(seconds: timezone).inHours;
  return '$hour:${unixDate.minute}';
}

double getSunriseSunsetPercentage(int sunrise, int sunset) {
  final DateTime now = DateTime.now();
  final DateTime sunriseDate =
      DateTime.fromMillisecondsSinceEpoch(sunrise * 1000, isUtc: true);
  final DateTime sunsetDate =
      DateTime.fromMillisecondsSinceEpoch(sunset * 1000, isUtc: true);
  // Return 1 if the current time is after sunset
  if (now.isAfter(sunsetDate)) {
    return 1;
  }
  // Return percentage if the current time is before sunset
  final int totalMinutes = sunsetDate.difference(sunriseDate).inMinutes;
  final int passedMinutes = now.difference(sunriseDate).inMinutes;
  return passedMinutes / totalMinutes;
}
