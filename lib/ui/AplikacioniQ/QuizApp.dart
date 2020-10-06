import 'package:flutter/material.dart';
import 'package:flutter_app/ui/AplikacioniQ/Question.dart';
import 'package:flutter_app/ui/AplikacioniQ/answer.dart';

class Quizz extends StatelessWidget {
  final Function selectAnswer;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quizz(this.selectAnswer, this.questions, this.questionIndex);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['question']),
        ...(questions[questionIndex]['options'] as List<String>)
            .map((alternatives) => (Answer(selectAnswer, alternatives)))
            .toList(),
      ],
    );
  }
}
