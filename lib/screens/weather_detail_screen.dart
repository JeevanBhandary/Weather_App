import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherDetailScreen extends StatelessWidget {
  final WeatherModel weather;

  WeatherDetailScreen({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${weather.cityName} Weather Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather.cityName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '${weather.temperature}°C',
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(width: 16),
                Text(
                  weather.description,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Min Temperature: ${weather.maxTemperature}°C',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Max Temperature: ${weather.maxTemperature}°C',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Humidity: ${weather.humidity}%',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Wind Speed: ${weather.windSpeed} m/s',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
