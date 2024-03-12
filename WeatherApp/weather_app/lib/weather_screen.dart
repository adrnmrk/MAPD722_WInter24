import 'package:flutter/material.dart';
import 'package:weather_app/Networking.dart';
import 'package:weather_app/Weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName = "";
  WeatherObject weatherObject = WeatherObject(0.0, 0, "", "", "");

  Future getWeather(String city) async {
    weatherObject = await Networking().getWeatherInCity(city);
    return weatherObject;
  }

  @override
  Widget build(BuildContext context) {
    cityName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
          child: FutureBuilder(
        future: getWeather(cityName),
        builder: (context, snapshot) {
          var icon = weatherObject.icon;
          return Column(
            children: [
              Text(weatherObject.cityName),
              Text(weatherObject.temp.toString()),
              Text(weatherObject.mainWeather),
              Text(weatherObject.humidity.toString()),
              Image.network(
                'https://openweathermap.org/img/wn/$icon@2x.png',
                width: 100,
                height: 100,
              )
            ],
          );
        },
      )),
    );
  }
}
