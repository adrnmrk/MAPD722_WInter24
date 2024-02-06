import 'package:flutter/material.dart';
import 'package:week4_mealapp/CategoryWidget.dart';
import 'package:week4_mealapp/DummyData.dart';
import 'package:week4_mealapp/MainDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.apptitle)),
      drawer: MainDrawer(),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 100,
            mainAxisExtent: 100,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((cat) => CategoryItem(cat)).toList(),
      ),
    );
  }
}
