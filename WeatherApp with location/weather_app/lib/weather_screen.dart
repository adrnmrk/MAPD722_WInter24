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
  String zipCode = "";
  WeatherObject weatherObject = WeatherObject(0.0, 0, "", "", "", "");

  Future getWeather(String city) async {
    weatherObject = await Networking().getWeatherInCity(city);
    return weatherObject;
  }

  Future getWeatherInLocation(double lat, double lon) async {
    weatherObject = await Networking().getWeatherInLocation(lat, lon);
    return weatherObject;
  }

  Future getWeatherIZipCode(String val) async {
    weatherObject = await Networking().getWeatherInZipCode(val);
    return weatherObject;
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as List;
    var source = arguments[0] as int;
    cityName = arguments[1] as String;
    var lat = arguments[2] as double;
    var lon = arguments[3] as double;
    zipCode = arguments[4] as String;

    var icon = "10d";
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
          child: FutureBuilder(
        future: getWeatherBySource(source, lat, lon),
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

  Future<dynamic> getWeatherBySource(int source, double lat, double lon) {
    if (source == 1) {
      return getWeather(cityName);
    } else if (source == 2) {
      return getWeatherInLocation(lat, lon);
    } else {
      return getWeatherIZipCode(zipCode);
    }
  }
}
