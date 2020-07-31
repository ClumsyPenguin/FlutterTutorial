import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function answerQuestions;

  Result(this.answerQuestions);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Quiz finished!',
            style: TextStyle(fontSize: 35),
          ),
        ),
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Restart Quiz'),
          onPressed: answerQuestions,
        )
      ],
    );
  }
}
