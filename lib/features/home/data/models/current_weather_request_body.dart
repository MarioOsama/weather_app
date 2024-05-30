import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_request_body.g.dart';

@JsonSerializable()
class CurrentWeatherRequestBody {
  const CurrentWeatherRequestBody(
      {required this.lon,
      required this.lat,
      required this.apiKey,
      required this.units});
  final double lon;
  final double lat;
  @JsonKey(name: 'appid')
  final String apiKey;
  final String units;

  factory CurrentWeatherRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherRequestBodyToJson(this);
}
