import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:week4_mealapp/CategoryList.dart';
import 'package:week4_mealapp/DummyData.dart';
import 'package:week4_mealapp/FilterScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:week4_mealapp/Meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> filters = {'isVegetaranian': false};
  List<Meal> filteredMeals = Dummy_Meals;

  void setFilters(Map<String, bool> filterdData) {
    filters = filterdData;
    filteredMeals = Dummy_Meals.where((m) {
      if (filterdData['isVegetaranian']! && !m.isVegetarian) {
        return false;
      } else {
        return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      routes: {
        '/': (context) => CategoryList(filteredMeals),
        '/category-meals': (context) => CategoryList(filteredMeals),
        '/filters-screen': (context) => FilterScreen(setFilters)
      },
    );
  }
}
