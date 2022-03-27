import 'package:weather_forcasting/features/home/domain/models/weather_base_reponse.dto.dart';

class HomeViewModel {
  const HomeViewModel({
    this.weatherBaseResponseDto,
    this.title,
  });

  final List<WeatherBaseResponseDto>? weatherBaseResponseDto;
  final String? title;

  HomeViewModel copyWith({
    List<WeatherBaseResponseDto>? weatherBaseResponseDto,
    String? title,
  }) =>
      HomeViewModel(
        weatherBaseResponseDto: weatherBaseResponseDto ?? this.weatherBaseResponseDto,
        title: title ?? this.title,
      );
}
