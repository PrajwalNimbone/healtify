import 'dart:math';

class Calculatorbrain {
  Calculatorbrain({required this.weight, required this.height});

  final int weight;
  final int height;
  double _bmi = 0;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body mass. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return "You have a normal body mass. Good job!";
    } else {
      return "You have a lower than normal body mass. Try to eat more healthy food.";
    }
  }
}
