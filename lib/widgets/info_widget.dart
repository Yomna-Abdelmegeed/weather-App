import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/cubit/weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<WeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(
              BlocProvider.of<WeatherCubit>(context).weatherModel?.state,
            )[50]!,
            getThemeColor(
              BlocProvider.of<WeatherCubit>(context).weatherModel?.state,
            )[500]!,
            getThemeColor(
              BlocProvider.of<WeatherCubit>(context).weatherModel?.state,
            )[700]!,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.city,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'updated at : ${weatherModel.time.hour}:${weatherModel.time.minute}  ',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(weatherModel.image),
              Text(
                '${weatherModel.avgTemp.round()}',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'max Temp :${weatherModel.maxTemp.round()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'min Temp :${weatherModel.minTemp.round()}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 48),
          Text(
            weatherModel.state,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
