import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _question;
  Question(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        this._question,
        style: TextStyle(
          fontSize: 27.8,
          fontStyle: FontStyle.italic,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
