// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_base_reponse.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherBaseResponseDto _$WeatherBaseResponseDtoFromJson(
    Map<String, dynamic> json) {
  return WeatherBaseResponseDto(
    consolidatedWeatherDto: (json['consolidated_weather'] as List<dynamic>)
        .map((e) => ConsolidatedWeatherDto.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$WeatherBaseResponseDtoToJson(
        WeatherBaseResponseDto instance) =>
    <String, dynamic>{
      'consolidated_weather':
          instance.consolidatedWeatherDto.map((e) => e.toJson()).toList(),
      'title': instance.title,
    };
