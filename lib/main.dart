import 'package:flutter/material.dart';
//import tells dart i want some functionality which is not in this file but in some other file
//the material dart file also has base class, which allows you to create your own widgets
//that's the StatelessWidget class
import './quiz.dart';
import './result.dart';

void main() {
  //we want to reach out to some other file (in this case in the flutter framework)
  //that gives us the class that we want to extend

  runApp(MyApp());
}

//extends tells that this class will be based on some other class
//you can only extend one class at a time
//pubspec yaml files: where we define which dependencies our application has/our dart project has
//we have one dependency and that's the flutter framework
//our class is a class that can be used as a widget by flutter
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Mahin', 'score': 1},
        {'text': 'Mahin', 'score': 1},
        {'text': 'Mahin', 'score': 1},
        {'text': 'Mahin', 'score': 1},
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  //build function is what dart and flutter will call in the end when they try to draw something on the screen
  //so the build method needs to return a widget
  @override
  Widget build(BuildContext context) {
    //home is basically the core widget which flutter will bring onto the screen when this entire app is
    //mounted to the screen
    //text widget is another widget built into flutter
    //MaterialApp is a class
    //Scaffold gives basic page design for app

    //map... key, value pairs

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
