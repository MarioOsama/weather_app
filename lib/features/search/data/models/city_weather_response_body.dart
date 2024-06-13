import 'package:json_annotation/json_annotation.dart';

part 'city_weather_response_body.g.dart';

@JsonSerializable()
class CityWeatherResponseBody {
  const CityWeatherResponseBody({
    required this.cityName,
    required this.country,
    required this.temp,
    required this.weatherDescription,
    required this.weatherMain,
  });

  @JsonKey(name: 'name')
  final String cityName;
  @JsonKey(fromJson: _countryFromJson)
  final String country;
  @JsonKey(fromJson: _tempFromJson)
  final double temp;
  @JsonKey(fromJson: _weatherDescriptionFromJson)
  final String weatherDescription;
  @JsonKey(fromJson: _weatherMainFromJson)
  final String weatherMain;

  factory CityWeatherResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherResponseBodyFromJson(json);

  static String _countryFromJson(dynamic json) {
    return json['sys']['country'] as String;
  }

  static double _tempFromJson(dynamic json) {
    return (json['main']['temp'] as num).toDouble();
  }

  static String _weatherDescriptionFromJson(dynamic json) {
    return json['weather'][0]['description'] as String;
  }

  static String _weatherMainFromJson(dynamic json) {
    return json['weather'][0]['main'] as String;
  }

  Map<String, dynamic> toJson() => _$CityWeatherResponseBodyToJson(this);
}
