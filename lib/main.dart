import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/cubit/weather_cubit.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                    BlocProvider.of<WeatherCubit>(context).weatherModel?.state,
                  ),
                  foregroundColor: Colors.white, // for icons & back arrow
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              home: HomeScreen(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    // ☀️ Bright & warm
    case 'sunny':
      return Colors.amber;

    // 🌃 Clear night
    case 'clear':
      return Colors.indigo;

    // 🌤️ Light clouds
    case 'partly cloudy':
      return Colors.blueGrey;
    case 'cloudy':
      return Colors.grey;

    // ☁️ Full overcast
    case 'overcast':
      return Colors.blueGrey;

    // 🌫 Misty or foggy
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.teal;

    // 🌧 Light to heavy rain
    case 'patchy rain possible':
    case 'patchy light rain':
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain':
      return Colors.blue;
    case 'heavy rain':
    case 'rain':
      return Colors.indigo;

    // ❄️ Snowy
    case 'patchy snow possible':
    case 'light snow':
      return Colors.cyan;
    case 'moderate snow':
      return Colors.lightBlue;
    case 'heavy snow':
    case 'snow':
      return Colors.blueGrey;

    // 🌩 Thunderstorms
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy rain with thunder':
      return Colors.deepOrange;

    // 🌨 Sleet
    case 'patchy sleet possible':
    case 'light sleet':
      return Colors.indigo;
    case 'moderate or heavy sleet':
      return Colors.blueGrey;

    // 🧊 Ice pellets
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
    case 'showers of ice pellets':
      return Colors.cyan;

    // 🌪 Blizzard
    case 'blizzard':
      return Colors.grey;

    // 🌀 Fallback for anything unknown
    default:
      return Colors.deepPurple;
  }
}
