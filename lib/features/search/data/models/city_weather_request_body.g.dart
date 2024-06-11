// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeatherRequestBody _$CityWeatherRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CityWeatherRequestBody(
      cityName: json['q'] as String,
      units: json['units'] as String,
      apiKey: json['apiKey'] as String,
    );

Map<String, dynamic> _$CityWeatherRequestBodyToJson(
        CityWeatherRequestBody instance) =>
    <String, dynamic>{
      'q': instance.cityName,
      'units': instance.units,
      'apiKey': instance.apiKey,
    };
