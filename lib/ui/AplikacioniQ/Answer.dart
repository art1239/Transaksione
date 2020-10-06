import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectAnswer;
  final String options;
  Answer(this.selectAnswer, this.options);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(options),
        onPressed: () => selectAnswer(options),
        color: Colors.blue,
      ),
    );
  }
}
