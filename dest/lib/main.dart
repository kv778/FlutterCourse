import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  // List<String> questions = [
  //   'This is supposed to be the first question',
  //   'Okay this is different now',
  //   'Yeah a totally changed question too',
  //   'Alright now I\'m out of ideas lol',
  //   'No not yet, I shall persist',
  //   'We need more questions, come on!',
  //   'Need to see how the answerMarks are coming along',
  //   'Almost there......',
  //   'Any second now.....',
  //   'Yep, that should do it tbh',
  //   'THE END'
  // ];
  //
  // List<bool> answers = [
  //   true,
  //   false,
  //   true,
  //   true,
  //   false,
  //   false,
  //   false,
  //   true,
  //   true,
  //   false,
  // ];
  QuizBrain obj = QuizBrain();
  int questionCtr = 0;

  List<Widget> scoreIcons = [
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Icon(
        Icons.check,
        color: Colors.green[800],
        size: 22.0,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: Icon(
        Icons.close,
        color: Colors.red[600],
        size: 22.0,
      ),
    ),
  ];

  List<Widget> scoreKeeper = [];
  bool disableButton = false;

  void checkAnswer(selectedAnswer) {
    bool correctAnswer = obj.getAnswer(questionCtr);
    setState(() {
      if(selectedAnswer == correctAnswer)
        scoreKeeper.add(scoreIcons[0]);
      else
        scoreKeeper.add(scoreIcons[1]);
      if(questionCtr < 10)
        ++questionCtr;
      if(questionCtr == 9)
        disableButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                obj.getQuestion(questionCtr),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green[700],
              disabledColor: Colors.transparent,
              disabledTextColor: Colors.grey[900],
              child: Text(
                'TRUE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: disableButton? null : () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red[600],
              disabledColor: Colors.transparent,
              disabledTextColor: Colors.grey[900],
              child: Text(
                'FALSE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: disableButton? null : () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: scoreKeeper,
        ),
      ],
    );
  }
}
