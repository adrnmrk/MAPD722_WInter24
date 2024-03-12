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
    var icon = "10d";
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
          child: FutureBuilder(
        future: getWeather(cityName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Text(
                  weatherObject.cityName,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  weatherObject.temp.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  weatherObject.mainWeather,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  weatherObject.humidity.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                Image.network(
                  'https://openweathermap.org/img/wn/${weatherObject.icon}@2x.png',
                  width: 100,
                  height: 100,
                )
              ],
            );
          } else {
            return const Text("Loading......");
          }
        },
      )),
    );
  }
}
