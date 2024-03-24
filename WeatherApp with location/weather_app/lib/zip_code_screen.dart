// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:weather_app/LocationManager.dart';
import './Networking.dart';
import './Weather.dart';

class ZipCodeScreen extends StatefulWidget {
  const ZipCodeScreen({Key? key}) : super(key: key);

  @override
  _ZipCodeScreenState createState() => _ZipCodeScreenState();
}

class _ZipCodeScreenState extends State<ZipCodeScreen> {
  var zipCodeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Zip Code')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Enter Zip Code'),
            // onChanged: (value) {
            //   getZipCodeSuggestions(value);
            //   // 
            // },
            onSubmitted: (String value) {
              if (value.isNotEmpty) {
                // Navigate to the weather screen with the entered zip code
                Navigator.pushNamed(context, '/weather', arguments: [3, value, 0.0, 0.0, value]);
              } else {
                // Handle empty zip code input if needed
              }
            },
          )
        ],
      ),
    );
  }
}
