import 'package:flutter/material.dart';
import 'package:quiz_app/Answer.dart';
import 'package:quiz_app/Question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int index;
  final VoidCallback _clickHandler;
  final List<String> answers;
  Quiz(this.questions, this.index, this._clickHandler, this.answers);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[index]['questionText'] as String),
        ...(questions[index]['answers'] as List<String>).map(
          (answer) {
            return Answer(answer, _clickHandler, answers, index);
          },
        ).toList(),
      ],
    );
  }
}
