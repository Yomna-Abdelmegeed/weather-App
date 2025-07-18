part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherInfoLoaded extends WeatherState {}

final class WeatherInfoIsLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {
  final String errorMessage;

  WeatherFailure({required this.errorMessage});
}
