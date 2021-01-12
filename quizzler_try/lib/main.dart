import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: MyQuiz(),
        ),
      ),
    );
  }
}

class MyQuiz extends StatefulWidget {
  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  bool disableButton = false;
  List<String> questions = [
    'This is supposed to be the first question',
    'Okay this is different now',
    'Yeah a totally changed question too',
    'Alright now I\'m out of idea lol',
    'No not yet, I shall persist',
    'We need more questions, come on!',
    'Need to see how the answerMarks are coming along',
    'Almost there......',
    'Any second now.....',
    'Yep, that should do it tbh',
    'THE END'
  ];
  List<bool> answers = [
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    true,
    false,
    false,
    true
  ];
  int questionCtr = 0;
  List<Icon> answerIcon = [
    Icon(
      Icons.check,
      color: Colors.green[500],
      size: 23.0,
    ),
    Icon(
      Icons.close,
      color: Colors.red[500],
      size: 23.0,
    )
  ];
  List<Icon> answerMarks = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                questions[questionCtr],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: FlatButton(
              color: Colors.green[600],
              textColor: Colors.white,
              disabledColor: Colors.grey[900],
              disabledTextColor: Colors.grey[900],
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              onPressed: disableButton? null : () {
                setState(() {
                  ++questionCtr;
                  if (answers[questionCtr - 1] == true) {
                    print('User entered the correct answer!');
                    answerMarks.add(answerIcon[0]);
                  } else {
                    print('User entered the wrong answer!');
                    answerMarks.add(answerIcon[1]);
                  }
                  if(questionCtr == 10) {
                    disableButton = true;
                  }

                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: FlatButton(
              color: Colors.red[500],
              textColor: Colors.white,
              disabledColor: Colors.grey[900],
              disabledTextColor: Colors.grey[900],
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              onPressed: disableButton? null : () {
                setState(() {
                  ++questionCtr;
                  if (answers[questionCtr - 1] == false) {
                    print('User entered the correct answer!');
                    answerMarks.add(answerIcon[0]);
                  } else {
                    print('User entered the wrong answer!');
                    answerMarks.add(answerIcon[1]);
                  }
                  if(questionCtr == 10) {
                    disableButton = true;
                  }
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: answerMarks,
          ),
        ),
      ],
    );
  }
}
