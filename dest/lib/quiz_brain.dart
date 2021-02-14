import 'questions.dart';

class QuizBrain{
  List<Questions> _questionBank = [
    Questions(questionText:'This is supposed to be the first question',questionAnswer:true),
    Questions(questionText:'Okay this is different now',questionAnswer:false),
    Questions(questionText:'Yeah a totally changed question too',questionAnswer:true),
    Questions(questionText:'Alright now I\'m out of ideas lol',questionAnswer:true),
    Questions(questionText:'No not yet, I shall persist',questionAnswer:false),
    Questions(questionText:'We need more questions, come on!',questionAnswer:false),
    Questions(questionText:'Need to see how the answerMarks are coming along',questionAnswer:false),
    Questions(questionText:'Almost there......',questionAnswer:true),
    Questions(questionText:'Any second now.....',questionAnswer:true),
    Questions(questionText:'Yep, that should do it',questionAnswer:false),
  ];

  String getQuestion(int questionCtr ) {
    return _questionBank[questionCtr].questionText;
  }

  bool getAnswer (int questionCtr) {
    return _questionBank[questionCtr].questionAnswer;
  }
}