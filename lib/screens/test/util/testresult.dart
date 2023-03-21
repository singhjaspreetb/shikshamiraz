import 'package:flutter/material.dart';


class TestResult extends StatelessWidget {
  final int score;
  final List<int> timeTakenPerQuestion;

  const TestResult({
    Key? key,
    required this.score,
    required this.timeTakenPerQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalTimeInSeconds = timeTakenPerQuestion.reduce((value, element) => value + element);
    int totalTimeInMinutes = (totalTimeInSeconds / 60).round();
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $score',
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Time Taken: $totalTimeInMinutes minutes',
              style: const TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}