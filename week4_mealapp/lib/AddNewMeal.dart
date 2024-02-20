import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4_mealapp/FavoriteMealsProvider.dart';
import 'package:week4_mealapp/ImageInput.dart';
import 'package:week4_mealapp/MainDrawer.dart';
import './UserMeal.dart';

class AddYourMealScreen extends StatefulWidget {
  const AddYourMealScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return AddYourMealScreenState();
  }
}

class AddYourMealScreenState extends State<AddYourMealScreen> {
  File? _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  final mealNameController = TextEditingController();

  void saveNewMeal() {
    if (mealNameController.text.isEmpty || _pickedImage == null)
      return;
    else {
      var us = UserMeal(title: mealNameController.text, image: _pickedImage!);
      Provider.of<FavoriteMealsProvider>(context, listen: false)
          .addUserMeal(us);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Meals'),
        actions: [
          IconButton(onPressed: saveNewMeal, icon: const Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Column(children: [
              TextField(
                decoration: const InputDecoration(labelText: 'The Meal Name'),
                controller: mealNameController,
              ),
              const SizedBox(
                height: 10,
              ),
              ImageInput(_selectImage)
            ]),
          )),
        ],
      ),
    );
  }
}
