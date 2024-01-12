import 'package:flutter/material.dart';
import 'package:monitor_banjir/models/weather_model.dart';
import 'package:monitor_banjir/services/weather.service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // ambil api key
  final _weatherService = WeatherService('b7616918af2d8bc0a3efb656ca815a77');
  Weather? _weather;

  // fetch data cuaca
  _fetchWeather() async {
    // ambil kota
    String cityName = await _weatherService.getCurrentCity();

    // ambil cuaca kota
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    // kalau error
    catch (e) {
      print(e);
    }
  }

  // animasi cuaca

  // init state
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
          // nama kota
          Text(_weather?.cityName ?? "Loading Kota...."),

          // temperature kota
          Text('${_weather?.temperature.round()}°C')
        ],
      ),
    );
  }
}