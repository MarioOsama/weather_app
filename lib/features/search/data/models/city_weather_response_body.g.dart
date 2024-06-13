// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeatherResponseBody _$CityWeatherResponseBodyFromJson(
        Map<String, dynamic> json) =>
    CityWeatherResponseBody(
      cityName: json['name'] as String,
      country: CityWeatherResponseBody._countryFromJson(json),
      temp: CityWeatherResponseBody._tempFromJson(json),
      weatherDescription:
          CityWeatherResponseBody._weatherDescriptionFromJson(json),
      weatherMain: CityWeatherResponseBody._weatherMainFromJson(json),
    );

Map<String, dynamic> _$CityWeatherResponseBodyToJson(
        CityWeatherResponseBody instance) =>
    <String, dynamic>{
      'name': instance.cityName,
      'country': instance.country,
      'temp': instance.temp,
      'weatherDescription': instance.weatherDescription,
    };
