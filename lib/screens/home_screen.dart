import 'package:flutter/material.dart';
import '../services/weather_api_service.dart';
import '../models/weather_model.dart';
import '../widgets/weather_widget.dart';
import '../widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherApiService _weatherApiService = WeatherApiService();
  late Future<WeatherModel> _weatherData;
  final TextEditingController _controller = TextEditingController();
  String _currentCity = 'Karkala'; // Default city

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  void _fetchWeather() {
    setState(() {
      _weatherData = _weatherApiService.fetchWeather(_currentCity);
    });
  }

  void _onSearch() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _currentCity = _controller.text;
        _fetchWeather();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter city name',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _onSearch(), // Perform search on enter key
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _onSearch,
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<WeatherModel>(
                future: _weatherData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingIndicator();
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return WeatherWidget(weather: snapshot.data!);
                  } else {
                    return Center(child: Text('No data available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
