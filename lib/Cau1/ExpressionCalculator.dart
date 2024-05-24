import 'dart:math';

class ExpressionCalculator {
  double calculateS(double x, int n) {
    double sum = x;
    for (int i = 1; i <= n; i++) {
      sum += pow(x, i);
    }
    return sum;
  }
}
