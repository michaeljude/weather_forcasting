import 'package:weather_forcasting/features/home/domain/models/weather_base_reponse.dto.dart';

abstract class HomeRepository {
  Future<WeatherBaseResponseDto> fetchWeather({required int weoid});
}
