import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.cmHeight, required this.kgWeight});

  final double cmHeight;
  final int kgWeight;

  double calculatedBmi = 0;

  String calculateBMI() {
    calculatedBmi = (kgWeight / pow(cmHeight, 2)) * 10000;
    return calculatedBmi.toStringAsFixed(1);
  }

  String getResult() {
    if (calculatedBmi >= 30) {
      return 'Obese\n(Alarming)';
    } else if (calculatedBmi >= 25) {
      return 'Overweight\n(Be Careful)';
    }else if (calculatedBmi >= 18.5) {
      return 'Healthy Weight\n(Normal)';
    } else {
      return 'Underweight\n(Be Careful)';
    }
  }

  String getAnalysis() {
    if (calculatedBmi >= 30) {
      return 'You are in the obese range which is a major health concern. You need exercise.';
    } else if (calculatedBmi >= 25) {
      return 'You are in the overweight range which may be a slight health concern. You should consider exercising.';
    } else if (calculatedBmi >= 18.5) {
      return 'You are in the healthy weight range for your size. Good job and keep it up!';
    }else {
      return 'You are in the underweight range which may be a slight health concern. You should eat more.';
    }
  }
}
