import 'dart:convert';

import 'package:flutter/services.dart';

class Quiz {
  late Map<String, dynamic> _schema;
  int _currentQuestion = 1;
  int _score = 0;

  Quiz(String schemaFile) {
    loadSchema(schemaFile);
  }

  Future<void> loadSchema(String schemaFile) async {
    final String schemaString = await rootBundle.loadString(schemaFile);
    _schema = json.decode(schemaString);
  }

  Map<String, dynamic> getCurrentQuestion() {
    return _schema[_currentQuestion.toString()];
  }

  void answerQuestion(String answer) {
    if (answer == getCurrentQuestion()['Answer']) {
      _score++;
    }
    _currentQuestion++;
  }

  int getScore() {
    return _score;
  }

  bool isLastQuestion() {
    return _currentQuestion == _schema.length;
  }

  void restartQuiz() {
    _currentQuestion = 1;
    _score = 0;
  }
}
