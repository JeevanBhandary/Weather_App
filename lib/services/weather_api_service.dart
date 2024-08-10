import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import '../utils/constants.dart';

class WeatherApiService {
  Future<WeatherModel> fetchWeather(String city) async {
    final url = Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'); // Adding units to get temperature in Celsius

    final response = await http.get(url);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.body}');
    }
  }
}
