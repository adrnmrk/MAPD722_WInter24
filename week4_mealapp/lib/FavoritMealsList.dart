import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4_mealapp/FavoriteMealsProvider.dart';
import './MainDrawer.dart';

class FavoriteMealsScreen extends StatelessWidget {
  const FavoriteMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Favorite Meals')),
        drawer: MainDrawer(),
        body: FutureBuilder(
          future: Provider.of<FavoriteMealsProvider>(context, listen: false)
              .getAllMealsFromDB(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<FavoriteMealsProvider>(
                  child: const Center(
                    child: Text('No Meals Yet'),
                  ),
                  builder: (context, FavoriteMealsProvider, child) =>
                      FavoriteMealsProvider.meals.isEmpty
                          ? child!
                          : ListView.builder(
                              itemCount: FavoriteMealsProvider.meals.length,
                              itemBuilder: (context, i) => ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: Image.network(
                                            FavoriteMealsProvider
                                                .meals[i].imageUrl)
                                        .image),
                                title:
                                    Text(FavoriteMealsProvider.meals[i].title),
                                onTap: () {},
                              ),
                            )),
        ));
  }
}
