import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      emit(WeatherInfoIsLoading());
      weatherModel = await Service(Dio()).getWeather(city: cityName);
      emit(WeatherInfoLoaded());
    } on Exception catch (e) {
      emit(WeatherFailure(errorMessage: e.toString()));
    }
  }
}
