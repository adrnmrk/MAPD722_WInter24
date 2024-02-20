import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4_mealapp/Meal.dart';
import 'package:week4_mealapp/SQLHelper.dart';
import 'package:week4_mealapp/UserMeal.dart';

class FavoriteMealsProvider extends ChangeNotifier {
  List<Meal> meals = [];
  static List<UserMeal> usermeals = [];

  void addUserMeal(UserMeal um) {
    usermeals.add(um);
    notifyListeners();
  }

  List<UserMeal> getAllUserMeals() {
    return usermeals;
  }

  void addMealIntDB(Meal m) {
    SQLHelper.insert('meals', {
      'id': m.id,
      'title': m.title,
      'image': m.imageUrl,
      'duration': m.duration
    });
    meals.add(m);
    notifyListeners();
  }

  Future<void> getAllMealsFromDB() async {
    var dblist = await SQLHelper.getData('meals', where: '', whereArgs: []);
    meals = dblist
        .map((meal) => Meal(
            id: meal['id'],
            categories: [],
            title: meal['title'],
            imageUrl: meal['image'],
            duration: meal['duration'],
            isVegetarian: false))
        .toList();
    notifyListeners();
  }
}
