import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class Service {
  final Dio dio;

  Service(this.dio);
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = 'bbdd0ffb45cc40ec9cf13504251307';
  late WeatherModel weatherModel;
  Future<WeatherModel> getWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
      weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['message'] ??
          'Oops! That was an error. Please try again later.';
      throw errorMessage;
    } catch (e) {
      log(e.toString());
      throw "Sorry, something went wrong. Try again shortly.";
    }
  }
}
