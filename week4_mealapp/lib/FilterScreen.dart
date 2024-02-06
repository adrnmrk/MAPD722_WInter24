import 'package:flutter/material.dart';
import 'package:week4_mealapp/MainDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterScreen extends StatelessWidget {
  var isVegeterian = true;
  var isQuick = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.filtersText)),
      drawer: MainDrawer(),
      body: ListView(children: [
        SwitchListTile(
          title: const Text('Only Vegetian Meals'),
          onChanged: null,
          value: isVegeterian,
        ),
        SwitchListTile(
            title: const Text('Only Quick Meals'),
            value: isQuick,
            onChanged: null)
      ]),
    );
  }
}
