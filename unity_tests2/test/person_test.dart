import '../person.dart';

void main() {
  final person = Person('Arthur', 19, 1.82, 85);

  print(
      "O imc deve vir '25.66': ${person.imc == 25.66 ? 'verdadeiro' : 'falso'}");
  print(person.imc);

  test("O imc deve vir '25.66'", () {
    expect();
  });
}
