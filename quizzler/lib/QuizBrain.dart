import 'Question.dart';

class QuizBrain {
  List<Question> _questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs', a:false),
    Question(q: 'Approximately one quarter of the human bones are in the feet', a:true),
    Question(q: 'A slug\'s blood is green', a:true)
  ];

  String getQuestionText(int questionNumber) {
    return _questionBank[questionNumber].questionText;
  }

  bool getQuestionAnswer(int questionNumber) {
    return _questionBank[questionNumber].questionAnswer;
  }
}