import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final VoidCallback restartHandler;
  final List<Map<int, String>> answers;
  final List<Map<int, int>> correctAnswers;
  const Result(
      this.questions, this.answers, this.restartHandler, this.correctAnswers);

  bool isCorrect(int index) {
    Map<int, int> correctAnswerMap = correctAnswers[index];
    int i = correctAnswerMap.values.last;
    var correctAnswerString = (questions[index]['answers'] as List)[i as int];
    return answers[index][1] == correctAnswerString ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    child: Card(
                        child: Column(children: [
                      Text(
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          questions[index]['questionText'] as String),
                      Text(
                        answers[index][1] as String,
                        style: TextStyle(
                            color: isCorrect(index) ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      isCorrect(index)
                          ? const Icon(Icons.check)
                          : const Icon(Icons.error)
                    ])),
                  );
                })),
        const Divider(),
        ElevatedButton(onPressed: restartHandler, child: const Text('Restart')),
      ],
    ));
  }
}
