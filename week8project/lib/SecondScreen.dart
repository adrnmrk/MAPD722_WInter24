import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8project/ValueProvider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Second Screen')),
        body: Consumer<ValueProvider>(
          builder: (context, valueprovider, child) {
            return Text('The value: ${valueprovider.value}');
          },
        ));
  }
}
