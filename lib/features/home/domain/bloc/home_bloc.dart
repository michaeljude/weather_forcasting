import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forcasting/core/main.dart';
import 'package:weather_forcasting/features/home/domain/bloc/home_state.dart';
import 'package:weather_forcasting/features/home/domain/models/weather_base_reponse.dto.dart';
import 'package:weather_forcasting/features/home/domain/repository/home_repository.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(this.homeRepository) : super(HomeState()) {
    init();
  }

  final HomeRepository homeRepository;

  void init() async {
    emit(state.copyWith(isLoading: true));
    try {
      List<WeatherBaseResponseDto> weatherList = <WeatherBaseResponseDto>[];
      WeatherBaseResponseDto result = await homeRepository.fetchWeather(weoid: 1105779);
      weatherList.addAll(<WeatherBaseResponseDto>[
        ...state.viewModel.weatherBaseResponseDto ?? <WeatherBaseResponseDto>[],
        result,
      ]);
      emit(state.copyWith(isLoading: false, viewModel: state.viewModel.copyWith(weatherBaseResponseDto: weatherList)));
    } on DioError catch (e) {
      logger.e(e);
    } catch (e) {
      logger.e(e);
    }
    try {
      List<WeatherBaseResponseDto> weatherList = <WeatherBaseResponseDto>[];
      WeatherBaseResponseDto result = await homeRepository.fetchWeather(weoid: 1103816);
      weatherList.addAll(<WeatherBaseResponseDto>[
        ...state.viewModel.weatherBaseResponseDto ?? <WeatherBaseResponseDto>[],
        result,
      ]);
      emit(state.copyWith(isLoading: false, viewModel: state.viewModel.copyWith(weatherBaseResponseDto: weatherList)));
    } on DioError catch (e) {
      logger.e(e);
    } catch (e) {
      logger.e(e);
    }
    try {
      List<WeatherBaseResponseDto> weatherList = <WeatherBaseResponseDto>[];
      WeatherBaseResponseDto result = await homeRepository.fetchWeather(weoid: 1100661);
      weatherList.addAll(<WeatherBaseResponseDto>[
        ...state.viewModel.weatherBaseResponseDto ?? <WeatherBaseResponseDto>[],
        result,
      ]);
      emit(state.copyWith(isLoading: false, viewModel: state.viewModel.copyWith(weatherBaseResponseDto: weatherList)));
    } on DioError catch (e) {
      logger.e(e);
    } catch (e) {
      logger.e(e);
    }
  }
}
