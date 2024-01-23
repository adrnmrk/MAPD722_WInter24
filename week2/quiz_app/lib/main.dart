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
  // var list  = [1, 2, 3, 4];
  // (list as List<Int>).map((){

  // });

  final List<String> answers = ['', '', '', ''];
  var _index = 0;
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
                    child: Result(questions, answers, onRestartCLicked),
                  )));
  }
}
