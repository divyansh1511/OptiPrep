import 'package:flutter_test/flutter_test.dart';

import 'calculator.dart';

void main() {
  late Calculator calc;

  setUpAll(() {
    calc = Calculator();
  });

  group("Testing the Calculator class", () {
    test("Testing the addition function", () {
      int ans = calc.add(10, 20);

      expect(ans, 30);
    });

    test("Testing the subtraction function", () {
      int ans = calc.sub(100, 40);

      expect(ans, 60);
    });

    test("Testing the multiplication function", () {
      int ans = calc.multiply(10, 20);

      expect(ans, 200);
    });

    test("Testing the Division function", () {
      double ans = calc.divide(100, 50);

      expect(ans, 2.0);
    });
  });

  test("Division by zero", () {
    expect(() => calc.divide(50, 0), throwsA(isA<DivideByZeroException>()));
  });

  tearDownAll(() {
    print("We are Done!!!");
  });
}
