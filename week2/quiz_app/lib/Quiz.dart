import 'package:flutter/material.dart';
import 'package:quiz_app/Answer.dart';
import 'package:quiz_app/Question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int index;
  Quiz(this.questions, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[index]['questionText'] as String),
        Answer((questions[index]['answers'] as List<String>)[0]),
        Answer((questions[index]['answers'] as List<String>)[1]),
        Answer((questions[index]['answers'] as List<String>)[2]),
        Answer((questions[index]['answers'] as List<String>)[3])
      ],
    );
  }
}
