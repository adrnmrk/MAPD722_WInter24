import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final List<String> answers;
  final VoidCallback restartHandler;
  const Result(this.questions, this.answers, this.restartHandler);

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 100,
                    child: Card(
                        child: Row(children: [
                      Text(
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          questions[index]['questionText'] as String),
                      Text(
                        answers[index],
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ])),
                  );
                })),
        const Divider(),
        ElevatedButton(onPressed: restartHandler, child: const Text('Restart')),
      ],
    ));
  }
}
