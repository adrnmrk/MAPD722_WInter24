import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final VoidCallback clickHandler;
  final List<String> answers;
  final int index;
  const Answer(this.answer, this.clickHandler, this.answers, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          answers[index] = answer;
          clickHandler();
        },
        child: Text(answer),
      ),
    );
  }
}
