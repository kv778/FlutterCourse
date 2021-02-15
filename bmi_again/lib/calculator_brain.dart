import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow((height/100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi > 25.0) {
      return 'Overweight';
    }
    else if (_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }

  String getInterpretation () {
    if(_bmi > 25) {
      return 'Your body weight is higher than normal. Try to exercise more.';
    }
    else if(_bmi > 18.5) {
      return 'You have normal body weight. Keep it up!';
    }
    else {
      return 'You have lower than normal body weight. Try to eat more.';
    }
  }
}
