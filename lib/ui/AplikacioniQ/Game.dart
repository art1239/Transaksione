import 'package:flutter/material.dart';
import 'QuizApp.dart';
import 'Result.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GameState();
  }
}

@override
class GameState extends State<Game> {
  var correctAnswers = 0;
  int _questionIndex = 0;

  bool isCorrect = false;

  var _questions = [
    {
      'question': 'Sa kontinente ka Bota?',
      'options': ['1', '5', '7'],
      'correctAnswer': '7',
    },
    {
      'question': 'Sa oqeane ka Bota',
      'options': ['1', '3', '5', '9'],
      'correctAnswer': '5',
    },
    {
      'question': 'Kush eshte kryeqyteti i Italise',
      'options': ['Rome', 'Paris', 'Berlin'],
      'correctAnswer': 'Rome',
    }
  ];

  checkTheQuestion(String correctAnswer) {
    print(_questions[_questionIndex]['correctAnswer']);
    print(correctAnswer);

    if (correctAnswer == _questions[_questionIndex]['correctAnswer']) {
      print('cORRECT $correctAnswers');
      isCorrect = true;
    }
  }

  _selectAnswer(String correctAnswer) {
    checkTheQuestion(correctAnswer);
    setState(() {
      if (isCorrect) {
        correctAnswers += 1;
        isCorrect = false;
      }
      _questionIndex = _questionIndex + 1;
    });
  }

  _resetQuestion() {
    setState(() {
      correctAnswers = 0;
      _questionIndex = 0;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Quizz'),
        backgroundColor: Colors.amber,
      ),
      body: _questionIndex < _questions.length
          ? Quizz(_selectAnswer, _questions, _questionIndex)
          : Result(this.correctAnswers, this._questionIndex, _resetQuestion),
    );
  }
}
