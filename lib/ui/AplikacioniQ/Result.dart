import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalQuestions;
  final int correctAnswers;
  final Function resetQuestions;

  Result(this.correctAnswers, this._totalQuestions, this.resetQuestions);
  String get endingPage =>
      'You found $correctAnswers out of $_totalQuestions questions';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            endingPage,
            style: TextStyle(fontSize: 28.8, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetQuestions,
            child: Text('Restart the app'),
            color: Colors.blueGrey[200],
          )
        ],
      ),
    );
  }
}
