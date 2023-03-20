import 'dart:async';

import 'package:flutter/material.dart';

class TestHome extends StatefulWidget {
  final Map<String, Map<String, dynamic>> questions;
  final int questionTimeLimit;
  final void Function(int) onQuizCompleted;

  const TestHome({
    Key? key,
    required this.questions,
    this.questionTimeLimit = 1, // in minutes
    required this.onQuizCompleted,
  }) : super(key: key);

  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  int _currentQuestionIndex = 1;
  Timer? _timer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startQuestionTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startQuestionTimer() {
    _remainingSeconds = widget.questionTimeLimit * 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_remainingSeconds <= 0) {
          _goToNextQuestion();
        } else {
          _remainingSeconds--;
        }
      });
    });
  }

  void _goToNextQuestion() {
    _timer?.cancel();
    if (_currentQuestionIndex == widget.questions.length) {
      widget.onQuizCompleted(_currentQuestionIndex);
    } else {
      _currentQuestionIndex++;
      _startQuestionTimer();
    }
  }

  void _selectAnswer(String selectedAnswer) {
    String correctAnswer =
        widget.questions[_currentQuestionIndex.toString()]!['answer'] as String;
    if (selectedAnswer == correctAnswer) {
      _goToNextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentQuestion = widget
        .questions[_currentQuestionIndex.toString()]!['question'] as String;
    List<String> options =
        (widget.questions[_currentQuestionIndex.toString()]!['options']
                as Map<String, dynamic>)
            .values
            .cast<String>()
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Question $_currentQuestionIndex'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion,
            style: const TextStyle(fontSize: 24.0),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Time Remaining: $_remainingSeconds seconds',
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 16.0),
          ...options.map(
            (option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => _selectAnswer(option),
                child: Text(option),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
