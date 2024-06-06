import 'package:json_annotation/json_annotation.dart';

part 'forecast_weather_response_body.g.dart';

@JsonSerializable()
class ForecastWeatherResponseBody {
  const ForecastWeatherResponseBody({
    required this.weatherList,
  });

  @JsonKey(name: 'list', fromJson: _weatherListFromJson)
  final List<Map> weatherList;

  static _weatherListFromJson(List list) {
    final weatherList = list
        .map((e) => {
              e['dt_txt'] as String: {
                'temp': e['main']['temp'] as num,
                'weather': e['weather'][0]['main'] as String,
              }
            })
        .toList();

    return weatherList;
  }

  factory ForecastWeatherResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeatherResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastWeatherResponseBodyToJson(this);
}
