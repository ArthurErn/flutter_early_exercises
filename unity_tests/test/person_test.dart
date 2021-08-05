import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:unity_tests/person.dart';

void main() {
  final person = Person('Arthur', 19, 1.82, 85);
  test("O imc deve vir '25.66'", () {
    expect(person.imc, 25.66);
  });

  test("maior que 18", () {
    expect(person.isOlder, true);
  });

  test("igual a 18", () {
    expect(person.isOlder, true);
  });
}
