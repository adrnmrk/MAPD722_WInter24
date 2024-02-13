import 'package:flutter/material.dart';
import 'package:week4_mealapp/Category.dart';
import 'package:week4_mealapp/DummyData.dart';
import 'package:week4_mealapp/MealWidget.dart';
import './Meal.dart';

class CategoryMeals extends StatelessWidget {
  final Category category;
  final List<Meal> filtered_Meals;
  const CategoryMeals(
      {required this.category, required this.filtered_Meals, super.key});

  @override
  Widget build(BuildContext context) {
    final filteredMeals = filtered_Meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    Widget content = ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (context, index) {
          return MealWidget(filteredMeals[index] as Meal);
        });

    if (filteredMeals.isEmpty) {
      content = const Center(
          child: Text(
        "Sorry No meals in this Category!!!",
        style: TextStyle(fontSize: 40),
      ));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: content);
  }
}
