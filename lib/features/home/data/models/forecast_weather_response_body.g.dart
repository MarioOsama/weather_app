// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWeatherResponseBody _$ForecastWeatherResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ForecastWeatherResponseBody(
      weatherList: ForecastWeatherResponseBody._weatherListFromJson(
          json['list'] as List),
    );

Map<String, dynamic> _$ForecastWeatherResponseBodyToJson(
        ForecastWeatherResponseBody instance) =>
    <String, dynamic>{
      'list': instance.weatherList,
    };
