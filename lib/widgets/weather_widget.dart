import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherModel weather;

  WeatherWidget({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.cityName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            '${weather.temperature}°C',
            style: TextStyle(fontSize: 48),
          ),
          Text(
            weather.description,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
