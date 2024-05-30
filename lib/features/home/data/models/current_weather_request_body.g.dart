// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherRequestBody _$CurrentWeatherRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherRequestBody(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      apiKey: json['appid'] as String,
      units: json['units'] as String,
    );

Map<String, dynamic> _$CurrentWeatherRequestBodyToJson(
        CurrentWeatherRequestBody instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
      'appid': instance.apiKey,
      'units': instance.units,
    };
