import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4_mealapp/FavoriteMealsProvider.dart';
import 'package:week4_mealapp/MainDrawer.dart';

class MyMealsScreen extends StatelessWidget {
  const MyMealsScreen({super.key});

  void toAddNewMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/add_my_meal', arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Own Meals'),
        actions: [
          IconButton(
              onPressed: () {
                toAddNewMeal(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      drawer: MainDrawer(),
      body: FutureBuilder(
          future: Provider.of<FavoriteMealsProvider>(context, listen: false)
              .getAllMealsFromDB(),
          builder: (cntx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<FavoriteMealsProvider>(
                  child: const Center(
                    child: Text('No Favorite Meals Yet'),
                  ),
                  builder: (context, FavoriteMeals, ch) => FavoriteMealsProvider
                          .usermeals.isEmpty
                      ? ch!
                      : ListView.builder(
                          itemCount: FavoriteMealsProvider.usermeals.length,
                          itemBuilder: (context, i) => ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: FileImage(
                                        FavoriteMealsProvider
                                            .usermeals[i].image)),
                                title: Text(
                                    FavoriteMealsProvider.usermeals[i].title),
                              )),
                )),
    );
  }
}
