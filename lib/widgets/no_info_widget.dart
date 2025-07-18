import 'package:flutter/material.dart';

class NoInfoWidget extends StatelessWidget {
  const NoInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          'No weather data yet 😔 Try searching for a city to get started!🔍',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
