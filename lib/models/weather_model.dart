class WeatherModel {
  final String city;
  final DateTime time;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String state;
  final String image;

  WeatherModel(
      {required this.city,
      required this.time,
      required this.maxTemp,
      required this.minTemp,
      required this.avgTemp,
      required this.state,
      required this.image});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json['location']['name'],
      time: stringToDateTime(json['current']['last_updated']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      state: json['current']['condition']['text'],
      image: reformatImage(json['current']['condition']['icon']),
    );
  }
}

String reformatImage(String url) {
  if (!url.startsWith('http')) {
    return 'http:$url';
  }
  return url;
}

DateTime stringToDateTime(String time) {
  return DateTime.parse(time);
}
