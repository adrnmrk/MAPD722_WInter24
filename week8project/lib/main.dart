import 'package:flutter/material.dart';
import 'package:week8project/FirsScreen.dart';
import 'package:week8project/SecondScreen.dart';
import 'package:provider/provider.dart';
import 'package:week8project/ValueProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ValueProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen()
      },
    );
  }
}
