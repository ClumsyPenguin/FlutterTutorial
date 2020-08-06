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
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 1}
      ]
    },
    {
      'questionText': 'What\s your favorite animal?',
      'answers': [
        {'text': 'Elephant', 'score': 10},
        {'text': 'Turtle', 'score': 5},
        {'text': 'Cat', 'score': 3},
        {'text': 'Dog', 'score': 1}
      ]
    },
    {
      'questionText': 'What\s your favorite book?',
      'answers': [
        {'text': 'Hunger Games', 'score': 10},
        {'text': 'Harry Potter', 'score': 5},
        {'text': 'The Hobbits', 'score': 3},
        {'text': 'Game Of Thrones', 'score': 1}
      ]
    },
    {
      'questionText': 'What\s your favorite season?',
      'answers': [
        {'text': 'Winter', 'score': 10},
        {'text': 'Spring', 'score': 5},
        {'text': 'Autumn', 'score': 3},
        {'text': 'Summer', 'score': 1}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex > _questions.length) {
      _questionIndex = 0;
      _totalScore = 0;
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
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(() => _answerQuestion(0), _totalScore),
      ),
    );
  }
}
