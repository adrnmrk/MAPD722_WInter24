import 'package:flutter/material.dart';
import 'package:week4_mealapp/Meal.dart';

class MealWidget extends StatelessWidget {
  final Meal meal;

  const MealWidget(this.meal);

  @override
  Widget build(Object context) {
    return Card(
      color: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        const Divider(),
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 250,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 25,
                right: 0,
                child: Text(
                  meal.title,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
        Text(
          "Meal Duration = ${meal.duration}",
          style: const TextStyle(
            fontSize: 20,
          ),
        )
      ]),
    );
  }
}
