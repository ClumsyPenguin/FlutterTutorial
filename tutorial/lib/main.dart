import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestions() {
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex >= 3) {
      _questionIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'Blue']
      },
      {
        'questionText': 'What\s your favorite animal?',
        'answers': ['Cat', 'Dog', 'Turtle', 'Elephant']
      },
      {
        'questionText': 'What\s your favorite book?',
        'answers': ['Nijntje', 'Harry Potter', 'Hunger Games', 'Clean Code']
      },
    ];
    return MaterialApp(
      title: 'Quiz app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz app'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...?(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestions, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
