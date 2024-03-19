import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Weather.dart';

class Networking {
  Future<List<String>> getAllCities(String city) async {
    http.Response response = await http
        .get(Uri.parse('http://gd.geobytes.com/AutoCompleteCity?&q=$city'));
    if (response.statusCode == 200) {
      // var list = jsonDecode(response.body) as List<String>;
      // return list;
      return List<String>.from(jsonDecode(response.body));
    } else {
      List<String> list = [];
      return list;
    }
  }

  Future<WeatherObject> getWeatherInCity(String cityFullName) async {
    var key = "071c3ffca10be01d334505630d2c1a9c";

    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityFullName&appid=$key&units=metric'));

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      var temp = jsonObject['main']['temp'] as double;
      var humidity = jsonObject['main']['humidity'] as int;
      var desc = jsonObject['weather'][0]['description'] as String;
      var icon = jsonObject['weather'][0]['icon'] as String;
      return WeatherObject(temp, humidity, icon, desc, cityFullName);
    } else {
      print(response.statusCode);
      return WeatherObject(0.0, 0, "", "No Result", cityFullName);
    }
  }

  Future<WeatherObject> getWeatherInLocation(double lat, double lon) async {
    var key = "071c3ffca10be01d334505630d2c1a9c";
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$key&units=metric'));

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      var temp = jsonObject['main']['temp'] as double;
      var humidity = jsonObject['main']['humidity'] as int;
      var desc = jsonObject['weather'][0]['description'] as String;
      var icon = jsonObject['weather'][0]['icon'] as String;
      var cityname = jsonObject['name'] as String;
      return WeatherObject(temp, humidity, icon, desc, cityname);
    } else {
      print(response.statusCode);
      return WeatherObject(0.0, 0, "", "No Result", " ");
    }
  }
}
