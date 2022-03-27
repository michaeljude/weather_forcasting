import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_forcasting/features/home/domain/models/weather_base_reponse.dto.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: 'https://www.metaweather.com/')
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET('api/location/{woeid}/')
  Future<WeatherBaseResponseDto> fetchWeather({@Path() required int woeid});
}
