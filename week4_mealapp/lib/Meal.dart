import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final int duration;
  final bool isVegetarian;
  final bool isQuick; //added for new filter

  const Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.isVegetarian,
      required this.isQuick}); //added for new filter

}
