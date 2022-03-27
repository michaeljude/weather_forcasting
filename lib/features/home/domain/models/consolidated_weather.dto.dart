import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'consolidated_weather.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ConsolidatedWeatherDto {
  ConsolidatedWeatherDto({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.humidity,
    required this.theTemp,
    required this.applicableDate,
    required this.windSpeed,
  });

  factory ConsolidatedWeatherDto.fromJson(Map<String, dynamic> json) => _$ConsolidatedWeatherDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ConsolidatedWeatherDtoToJson(this);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'weather_state_name')
  final String weatherStateName;

  @JsonKey(name: 'weather_state_abbr')
  final String weatherStateAbbr;

  @JsonKey(name: 'humidity')
  final int humidity;

  @JsonKey(name: 'the_temp')
  final double theTemp;

  @JsonKey(name: 'created')
  final String applicableDate;

  @JsonKey(name: 'wind_speed')
  final double windSpeed;
}

// "id": 4593492161462272,
// "weather_state_name": "Heavy Rain",
// "weather_state_abbr": "hr",
// "wind_direction_compass": "SE",
// "created": "2022-03-27T04:00:10.934739Z",
// "applicable_date": "2022-03-27",
// "min_temp": 18.42,
// "max_temp": 21.88,
// "the_temp": 21.855,
// "wind_speed": 5.4487861230759025,
// "wind_direction": 129.38713888574284,
// "air_pressure": 1017.0,
// "humidity": 81,
// "visibility": 9.238236200588563,
// "predictability": 77