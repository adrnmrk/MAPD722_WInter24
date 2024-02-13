import 'package:flutter/material.dart';
import 'package:week4_mealapp/MainDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterScreen extends StatefulWidget {
  final Function(Map<String, bool>) saveFilters;

  FilterScreen(this.saveFilters);

  @override
  State<StatefulWidget> createState() {
    return FilterScreeState();
  }
}

class FilterScreeState extends State<FilterScreen> {
  var isVegeterian = false;
  var isQuick = false;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _isV;
  @override
  void initState() {
    super.initState();
    _isV = _prefs.then((SharedPreferences prefs) {
      isVegeterian = prefs.getBool('isV') ?? false;
      return isVegeterian;
    });
  }

  void saveisVegFilter(bool isv) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _isV = prefs.setBool('isV', isv).then(
        (bool succss) {
          isVegeterian = isv;
          return isv;
        },
      );
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
                widget.saveFilters({'isVegetaranian': isVegeterian});
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: ListView(children: [
        FutureBuilder(
          future: _isV,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                if (!snapshot.hasError) {
                  return SwitchListTile(
                    title: const Text('Only Vegetian Meals'),
                    onChanged: (value) => saveisVegFilter(value),
                    value: snapshot.data as bool,
                  );
                } else {
                  return Text(
                    'Button tapped ${snapshot.data} time${snapshot.data == true ? true : false}.\n\n'
                    'This should persist across restarts.',
                  );
                }
            }
          },
        ),
        SwitchListTile(
          title: const Text('Only Quick Meals'),
          value: isQuick,
          onChanged: (value) {
            setState(() {
              isQuick = value;
            });
          },
        )
      ]),
    );
  }
}
