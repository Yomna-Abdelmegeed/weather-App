import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/cubit/weather_cubit.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/info_widget.dart';
import 'package:weather_app/widgets/no_info_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return NoInfoWidget();
          } else if (state is WeatherInfoIsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            );
          } else {
            return InfoWidget();
          }
        },
      ),
    );
  }
}
