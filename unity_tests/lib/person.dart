import 'dart:math' as math;

class Person {
  final String name;
  final int age;
  final double height;
  final double weight;

  Person(this.name, this.age, this.height, this.weight);

  double get imc {
    var result = weight / math.pow(height, 2);
    result = result * 100;
    return result.roundToDouble() / 100;
  }

  bool get isOlder {
    return age >= 18;
  }
}
