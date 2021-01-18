import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        //three dots (spread operator) take a list and pulls all the values in the
        //list out of it and adds them to the surrounding list as individual values
        //so we don't add a list to a list, but the values of a list to a list
        //having only one list without a nested list
        //we transform every answer into an answer widget
        //we then make sure this is a list
        //then we take these generated answer widgets and we add it to this list here
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
