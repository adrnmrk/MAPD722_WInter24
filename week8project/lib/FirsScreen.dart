import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8project/ValueProvider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void add() {
      Provider.of<ValueProvider>(context, listen: false).increment();
    }

    void sub() {
      Provider.of<ValueProvider>(context, listen: false).decrement();
    }

    void setToZero() {
      Provider.of<ValueProvider>(context, listen: false).setToZero();
    }

    void goToSecond() {
      Navigator.of(context).pushNamed('/second');
    }

    return Scaffold(
        body: Center(
      child: Column(children: [
        const Spacer(),
        ElevatedButton(onPressed: add, child: Text('Update +1')),
        ElevatedButton(onPressed: sub, child: Text('Update -1')),
        ElevatedButton(onPressed: setToZero, child: Text('Set To Zero')),
        ElevatedButton(onPressed: goToSecond, child: Text('To Second Screen')),
        Consumer<ValueProvider>(
          builder: (context, valueprovider, child) {
            return Text('The value: ${valueprovider.value}');
          },
        ),
        const Spacer(),
      ]),
    ));
  }
}
