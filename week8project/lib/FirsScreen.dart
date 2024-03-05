import 'package:flutter/material.dart';

class FirsScreen extends StatelessWidget {
  const FirsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void updateClicked() {}

    void setToZero() {}

    void goToSecond() {
      Navigator.of(context).pushNamed('/second');
    }

    return Scaffold(
        body: Center(
      child: Column(children: [
        const Spacer(),
        ElevatedButton(onPressed: updateClicked, child: Text('Update +1')),
        ElevatedButton(onPressed: updateClicked, child: Text('Update -1')),
        ElevatedButton(onPressed: setToZero, child: Text('Set To Zero')),
        ElevatedButton(onPressed: goToSecond, child: Text('To Second Screen')),
        const Spacer(),
      ]),
    ));
  }
}
