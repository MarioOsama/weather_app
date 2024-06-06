import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_request_body.g.dart';

@JsonSerializable()
class WeatherRequestBody {
  const WeatherRequestBody(
      {required this.lon,
      required this.lat,
      required this.apiKey,
      required this.units});
  final double lon;
  final double lat;
  @JsonKey(name: 'appid')
  final String apiKey;
  final String units;

  factory WeatherRequestBody.fromJson(Map<String, dynamic> json) =>
      _$WeatherRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRequestBodyToJson(this);
}
