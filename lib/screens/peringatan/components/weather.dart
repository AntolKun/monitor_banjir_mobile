import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:monitor_banjir/models/weather_model.dart';
import 'package:monitor_banjir/services/weather.service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('b7616918af2d8bc0a3efb656ca815a77');
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/images/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'few clouds':
      case 'scattered clouds':
      case 'broken clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/images/cloudy.json';
      case 'rain':
      case 'shower rain':
      case 'drizzle':
        return 'assets/images/rainy.json';
      case 'thunderstorm':
        return 'assets/images/storm.json';
      case 'clear':
        return 'assets/images/sunny.json';
      default:
        return 'assets/images/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on_rounded,
            size: 40,
            color: Color(0xFF575757),
          ),
          Text(_weather?.cityName ?? "Loading Kota....",
            style: const TextStyle(
              fontFamily: "Bebas Neue",
              fontSize: 48,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
          Text('${_weather?.temperature.round()}°C', 
            style: const TextStyle(
              fontFamily: "Bebas Neue",
              fontSize: 35,
              color: Color(0xFF575757)
            ),
          ),
          Text(_weather?.mainCondition ?? "", 
            style: const TextStyle(
              fontFamily: "Bebas Neue",
              fontSize: 35,
              color: Color(0xFF575757)
            ),
          ),
        ],
      ),
    );
  }
}
