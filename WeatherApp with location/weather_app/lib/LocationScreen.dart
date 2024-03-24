import 'package:flutter/material.dart';
import 'package:weather_app/LocationManager.dart';
import './Networking.dart';
import './Weather.dart';
import './zip_code_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  void goToSearch(BuildContext context) {
    Navigator.pushNamed(context, '/search');
  }

  void getLocation(BuildContext context) async {
    var position = await LocationManager().getCurrentLocation();
    var lat = position.latitude;
    var lon = position.longitude;

    Navigator.pushNamed(context, '/weather', arguments: [2, " ", lat, lon]);
  }

  void goToZipCode(BuildContext context) {
    Navigator.pushNamed(context, '/zipcode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                goToSearch(context);
              },
              child: const Text('Search For Cities'),
            ),
            ElevatedButton(
              onPressed: () {
                getLocation(context);
              },
              child: const Text('Get Weather In Current Location'),
            ),
            ElevatedButton(
              onPressed: () {
                goToZipCode(context);
              },
              child: const Text('Get Weather using Zip Code'),
            ),
          ],
        ),
      ),
    );
  }
}
