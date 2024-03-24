import 'package:flutter/material.dart';
import 'package:week4_mealapp/MainDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FilterScreen extends StatefulWidget {
  final Function(Map<String, bool>) saveFilters;

  const FilterScreen(this.saveFilters, {required bool isQuick}); //added for quick meals

  @override
  State<StatefulWidget> createState() {
    return FilterScreeState();
  }
}

class FilterScreeState extends State<FilterScreen> {
  var isVegetarian = false;
  var isQuick = false; //added for quick meals

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _isVegetarian;
  late Future<bool> _isQuick; //added for quick meals

  @override
  void initState() {
    super.initState();
    _isVegetarian = _prefs.then((SharedPreferences prefs) {
      isVegetarian = prefs.getBool('isVegetarian') ?? false;
      return isVegetarian;
    });
    _isQuick = _prefs.then((SharedPreferences prefs) {
      isQuick = prefs.getBool('isQuick') ?? false;
      return isQuick;
    });
  }

  void saveVegetarianFilter(bool value) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _isVegetarian = prefs.setBool('isVegetarian', value).then((bool success) {
        isVegetarian = value;
        return value;
      });
    });
  }
//added for quick meals
  void saveQuickFilter(bool value) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _isQuick = prefs.setBool('isQuick', value).then((bool success) {
        isQuick = value;
        return value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.filtersText),
        actions: [
          IconButton(
            onPressed: () {
              widget.saveFilters({
                'isVegetarian': isVegetarian,
                'isQuick': isQuick,
              });
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: [
          FutureBuilder<bool>(
            future: _isVegetarian,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                case ConnectionState.done:
                  if (!snapshot.hasError) {
                    return SwitchListTile(
                      title: const Text('Only Vegetarian Meals'),
                      onChanged: (value) => saveVegetarianFilter(value),
                      value: snapshot.data!,
                    );
                  } else {
                    return Text(
                      'Error: ${snapshot.error}',
                    );
                  }
              }
            },
          ),
          //added for quick meals
          FutureBuilder<bool>(
            future: _isQuick,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                case ConnectionState.done:
                  if (!snapshot.hasError) {
                    return SwitchListTile(
                      title: const Text('Only Quick Meals'),
                      onChanged: (value) => saveQuickFilter(value),
                      value: snapshot.data!,
                    );
                  } else {
                    return Text(
                      'Error: ${snapshot.error}',
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
