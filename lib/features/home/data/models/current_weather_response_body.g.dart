// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherResponseBody _$CurrentWeatherResponseBodyFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherResponseBody(
      cityName: json['name'] as String,
      temp: CurrentWeatherResponseBody._tempFromJson(json),
      pressure: CurrentWeatherResponseBody._pressureFromJson(json),
      humidity: CurrentWeatherResponseBody._humidityFromJson(json),
      windSpeed: CurrentWeatherResponseBody._windSpeedFromJson(json),
      windDeg: CurrentWeatherResponseBody._windDegFromJson(json),
      weatherDescription:
          CurrentWeatherResponseBody._weatherDescriptionFromJson(json),
      sunrise: CurrentWeatherResponseBody._sunriseFromJson(json),
      sunset: CurrentWeatherResponseBody._sunsetFromJson(json),
      feelsLike: CurrentWeatherResponseBody._feelsLikeFromJson(json),
    );

Map<String, dynamic> _$CurrentWeatherResponseBodyToJson(
        CurrentWeatherResponseBody instance) =>
    <String, dynamic>{
      'name': instance.cityName,
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'windDeg': instance.windDeg,
      'weatherDescription': instance.weatherDescription,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'feelsLike': instance.feelsLike,
    };
