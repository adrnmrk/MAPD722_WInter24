import 'package:flutter/material.dart';
import 'package:quiz_app/Answer.dart';
import 'package:quiz_app/Question.dart';
import 'package:quiz_app/Quiz.dart';
import 'package:quiz_app/Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final List<Map<int, String>> answers = [
    {0: ''},
    {1: ''},
    {2: ''}
  ];
  final List<Map<int, int>> correct_answers = [
    {0: 0},
    {1: 2},
    {2: 1}
  ];

  var _index = 0;
  var questions = [
    {
      'questionText': 'What is the capital of the United States?',
      'answers': ['Washington, D.C', 'New York', 'London', 'Boston']
    },
    {
      'questionText': 'What is the capital of China?',
      'answers': ['Tokyo', 'Seoul', 'Beijing', 'Shanghai']
    },
    {
      'questionText': 'What is the capital of India?',
      'answers': ['Mumbai', 'New Delhi', 'Kathmandu', 'Lahore']
    }
  ];

  void onAnswerCLicked() {
    setState(() {
      _index += 1;
    });
  }

  void onRestartCLicked() {
    setState(() {
      _index = 0;
    });
  }

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
                    child: Quiz(questions, _index, onAnswerCLicked, answers),
                  )
                : Center(
                    child: Result(
                        questions, answers, onRestartCLicked, correct_answers),
                  )));
  }
}
