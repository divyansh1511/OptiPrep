class Calculator {
  int add(a, b) {
    return a + b;
  }

  int sub(a, b) {
    return a - b;
  }

  int multiply(a, b) {
    return a * b;
  }

  double divide(a, b) {
    if (b == 0) {
      throw DivideByZeroException("Divide by zero");
    }
    return a / b;
  }
}

class DivideByZeroException implements Exception {
  final String message;
  DivideByZeroException(this.message);
}
