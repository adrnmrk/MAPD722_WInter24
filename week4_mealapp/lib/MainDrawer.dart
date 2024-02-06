import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.drawertitle,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('All Categories'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter),
            title: const Text('Filters'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/filters-screen');
            },
          )
        ],
      ),
    );
  }
}
