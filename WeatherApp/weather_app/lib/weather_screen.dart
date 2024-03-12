import 'package:flutter/material.dart';
import 'package:weather_app/Weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName = "";
  WeatherObject wo = WeatherObject(0.0, "10d", " ");

  @override
  Widget build(BuildContext context) {
    cityName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(title: const Text('Weather')), body: Text("Weather"));
  }
}
