// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRequestBody _$WeatherRequestBodyFromJson(Map<String, dynamic> json) =>
    WeatherRequestBody(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      apiKey: json['appid'] as String,
      units: json['units'] as String,
    );

Map<String, dynamic> _$WeatherRequestBodyToJson(WeatherRequestBody instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
      'appid': instance.apiKey,
      'units': instance.units,
    };
