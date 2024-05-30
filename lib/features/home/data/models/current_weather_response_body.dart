import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_response_body.g.dart';

@JsonSerializable()
class CurrentWeatherResponseBody {
  const CurrentWeatherResponseBody({
    required this.cityName,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.weatherDescription,
    required this.sunrise,
    required this.sunset,
    required this.feelsLike,
  });

  @JsonKey(name: 'name')
  final String cityName;
  @JsonKey(fromJson: _tempFromJson)
  final double temp;
  @JsonKey(fromJson: _pressureFromJson)
  final double pressure;
  @JsonKey(fromJson: _humidityFromJson)
  final double humidity;
  @JsonKey(fromJson: _windSpeedFromJson)
  final double windSpeed;
  @JsonKey(fromJson: _windDegFromJson)
  final double windDeg;
  @JsonKey(fromJson: _weatherDescriptionFromJson)
  final String weatherDescription;
  @JsonKey(fromJson: _sunriseFromJson)
  final int sunrise;
  @JsonKey(fromJson: _sunsetFromJson)
  final int sunset;
  @JsonKey(fromJson: _feelsLikeFromJson)
  final double feelsLike;

  static double _tempFromJson(dynamic json) {
    return (json['main']['temp'] as num).toDouble();
  }

  static double _pressureFromJson(dynamic json) {
    return (json['main']['pressure'] as num).toDouble();
  }

  static double _humidityFromJson(dynamic json) {
    return (json['main']['humidity'] as num).toDouble();
  }

  static double _windSpeedFromJson(dynamic json) {
    return (json['wind']['speed'] as num).toDouble();
  }

  static double _windDegFromJson(dynamic json) {
    return (json['wind']['deg'] as num).toDouble();
  }

  static String _weatherDescriptionFromJson(dynamic json) {
    return (json['weather'][0]['description'] as String);
  }

  static int _sunriseFromJson(dynamic json) {
    return (json['sys']['sunrise'] as num).toInt();
  }

  static int _sunsetFromJson(dynamic json) {
    return (json['sys']['sunset'] as num).toInt();
  }

  static double _feelsLikeFromJson(dynamic json) {
    return (json['main']['feels_like'] as num).toDouble();
  }

  factory CurrentWeatherResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherResponseBodyToJson(this);
}
