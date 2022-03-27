import 'package:weather_forcasting/features/home/domain/models/weather_base_reponse.dto.dart';
import 'package:weather_forcasting/features/home/domain/repository/home_repository.dart';
import 'package:weather_forcasting/features/home/domain/service/home_api_service.dart';

class HomeRepositoryImpl implements HomeRepository {

  HomeRepositoryImpl({
    required this.apiService,
  });

  final HomeApiService apiService;

  @override
  Future<WeatherBaseResponseDto> fetchWeather({required int weoid}) async => apiService.fetchWeather(woeid: weoid);

}
