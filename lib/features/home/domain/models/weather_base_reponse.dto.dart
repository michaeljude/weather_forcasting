import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_forcasting/features/home/domain/models/consolidated_weather.dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_base_reponse.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherBaseResponseDto {
  const WeatherBaseResponseDto({required this.consolidatedWeatherDto, required this.title});

  factory WeatherBaseResponseDto.fromJson(Map<String, dynamic> json) => _$WeatherBaseResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherBaseResponseDtoToJson(this);

  @JsonKey(name: 'consolidated_weather')
  final List<ConsolidatedWeatherDto> consolidatedWeatherDto;

  @JsonKey(name: 'title')
  final String title;
}
