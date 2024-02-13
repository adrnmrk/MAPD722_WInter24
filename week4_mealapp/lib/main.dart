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
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'isVegetarian': false,
    'isQuick': false
  }; // Add isQuick filter
  List<Meal> filteredMeals = Dummy_Meals;
  bool isQuick = false; // Track the state of "Only Quick Meals" filter

  void setFilters(Map<String, bool> filterdData) {
    setState(() {
      filters = filterdData;
      isQuick =
          filters['isQuick'] ?? false; // Update isQuick based on filter data
      filteredMeals = Dummy_Meals.where((m) {
        if ((filters['isVegetarian'] ?? false) && !m.isVegetarian) {
          return false;
        } else if (isQuick && !m.isQuick) {
          // Apply "Only Quick Meals" filter
          return false;
        } else {
          return true;
        }
      }).toList();
    });
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
        '/filters-screen': (context) => FilterScreen(setFilters,
            isQuick: isQuick), // Pass isQuick to FilterScreen
      },
    );
  }
}
