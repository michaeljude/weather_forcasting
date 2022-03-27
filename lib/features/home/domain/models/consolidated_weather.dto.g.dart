// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consolidated_weather.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsolidatedWeatherDto _$ConsolidatedWeatherDtoFromJson(
    Map<String, dynamic> json) {
  return ConsolidatedWeatherDto(
    id: json['id'] as int,
    weatherStateName: json['weather_state_name'] as String,
    weatherStateAbbr: json['weather_state_abbr'] as String,
    humidity: json['humidity'] as int,
    theTemp: (json['the_temp'] as num).toDouble(),
    applicableDate: json['created'] as String,
    windSpeed: (json['wind_speed'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ConsolidatedWeatherDtoToJson(
        ConsolidatedWeatherDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': instance.weatherStateAbbr,
      'humidity': instance.humidity,
      'the_temp': instance.theTemp,
      'created': instance.applicableDate,
      'wind_speed': instance.windSpeed,
    };
