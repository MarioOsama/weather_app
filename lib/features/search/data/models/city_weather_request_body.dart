import 'package:json_annotation/json_annotation.dart';

part 'city_weather_request_body.g.dart';

@JsonSerializable()
class CityWeatherRequestBody {
  const CityWeatherRequestBody(
      {required this.cityName,
      required this.units,
      required this.apiKey,
      this.lang = 'en'});

  @JsonKey(name: 'q')
  final String cityName;
  final String units;
  final String apiKey;
  final String? lang;

  factory CityWeatherRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CityWeatherRequestBodyToJson(this);
}
