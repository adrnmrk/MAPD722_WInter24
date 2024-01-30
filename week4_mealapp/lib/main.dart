import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:week4_mealapp/CategoryWidget.dart';
import 'package:week4_mealapp/DummyData.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meal App")),
      body: Expanded(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 30,
              mainAxisExtent: 30),
          children: DUMMY_CATEGORIES
              .map((cat) => CategoryItem(cat.id, cat.title, cat.color))
              .toList(),
        ),
      ),
    );
  }
}
