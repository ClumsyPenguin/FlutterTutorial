import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
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
    {
      'questionText': 'What\s your favorite season?',
      'answers': ['Winter', 'Autum', 'Summer', 'Spring']
    },
  ];

  void _answerQuestions() {
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex > _questions.length) {
      _questionIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_answerQuestions),
      ),
    );
  }
}
