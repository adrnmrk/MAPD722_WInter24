import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4_mealapp/FavoriteMealsProvider.dart';
import 'package:week4_mealapp/Meal.dart';

class MealWidget extends StatefulWidget {
  final Meal meal;
  const MealWidget(this.meal);
  @override
  State<StatefulWidget> createState() {
    return MealWidgetState();
  }
}

class MealWidgetState extends State<MealWidget> {
  var iconColor = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void saveMeal() {
    setState(() {
      iconColor = Colors.amber;
      Provider.of<FavoriteMealsProvider>(context, listen: false)
          .addMealIntDB(widget.meal);
    });
  }

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
                widget.meal.imageUrl,
                width: double.infinity,
                height: 250,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 25,
                right: 0,
                child: Text(
                  widget.meal.title,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
        Row(
          children: [
            Text(
              "Meal Duration = ${widget.meal.duration}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Expanded(
                child: IconButton(
                    onPressed: saveMeal,
                    icon: Icon(
                      Icons.star,
                      color: iconColor,
                      size: 40,
                    )))
          ],
        )
      ]),
    );
  }
}
