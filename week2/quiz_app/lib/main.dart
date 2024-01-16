import 'package:flutter/material.dart';
import 'package:quiz_app/Answer.dart';
import 'package:quiz_app/Question.dart';
import 'package:quiz_app/Quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var _index = 2;
  var questions = [
    {
      'questionText': 'What is your fav color?',
      'answers': ['Black', 'Red', 'Blue', 'Green']
    },
    {
      'questionText': 'What is your fav animal?',
      'answers': ['Cat', 'Dog', 'Rabbit', 'Lion']
    },
    {
      'questionText': 'What is your fav city?',
      'answers': ['Toronto', 'NewYork', 'Paris', 'Rome']
    }
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Quiz App'),
            ),
            backgroundColor: const Color.fromARGB(223, 234, 200, 207),
            body: _index < questions.length
                ? Center(
                    child: Quiz(questions, _index),
                  )
                : const Center(
                    child: Text('All Done'),
                  )));
  }
}
