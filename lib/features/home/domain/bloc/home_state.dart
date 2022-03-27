import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_forcasting/features/home/domain/models/home.vm.dart';
import 'package:weather_forcasting/features/home/domain/models/weather_base_reponse.dto.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool isLoading,
    @Default(HomeViewModel(weatherBaseResponseDto: <WeatherBaseResponseDto>[])) HomeViewModel viewModel,
  }) = _HomeState;
}
