import 'dart:math';

class CalcBrain {

  CalcBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;
  String _result;
  String _interpretation;

  String calcBMI() {
    _bmi = weight / pow((height/100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String calcResult() {
    if(_bmi >= 25) {
      _result = 'Overweight';
    }
    else if(_bmi >= 18) {
      _result = 'Normal';
    }
    else {
      _result = 'Underweight';
    }
    return _result;
  }

  String calcInterpretation() {
    if(_bmi >= 25) {
      _interpretation = 'Your BMI is quite high, you should exercise more.';
    }
    else if(_bmi >= 18) {
      _interpretation = 'Your BMI is Normal. Good job!';
    }
    else {
      _interpretation = 'Your BMI is quite low. You should eat more.';
    }
    return _interpretation;
  }

}
