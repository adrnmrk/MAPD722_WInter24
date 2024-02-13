import 'package:flutter/material.dart';
import 'package:week4_mealapp/Category.dart';
import 'package:week4_mealapp/CategoryMeals.dart';
import 'package:week4_mealapp/Meal.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final List<Meal> filteredMeals;
  const CategoryItem(this.category, this.filteredMeals);

  void selectCategory(BuildContext context, Category category) {
    // Navigator.of(context).push(route)

    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return CategoryMeals(
        category: category,
        filtered_Meals: filteredMeals,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context, category);
      },
      child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: category.color, borderRadius: BorderRadius.circular(15)),
          child: Text(
            category.title,
            style: const TextStyle(fontSize: 15),
          )),
    );
  }
}
