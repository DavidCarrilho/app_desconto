import 'package:flutter_test/flutter_test.dart';
import 'package:app_desconto/main.dart';

void main() {
  const valorSemDesconto = 150.0;
  test('Deve calcular desconto corretamente utilizando números decimais', () {
    // arrange
    const desconto = 25.0;
    // act
    const valorComDesconto = valorSemDesconto - desconto;
    // assert
    expect(calcularDesconto(valorSemDesconto, desconto, 0), valorComDesconto);
  });
  test('Deve calcular o desconto corretamente utilizando porcentagem', () {
    // arrange
    var desconto = 10.0;
    var valorComDesconto = 135.0;
    // assert
    expect(calcularDesconto(valorSemDesconto, desconto, 1), valorComDesconto);
  });
  test('Deve dar erro ao calcula valor com desconto negativo ou zero', () {
    expect(() => calcularDesconto(valorSemDesconto, -1, 1),
        throwsA(isA<ArgumentError>()));

    expect(() => calcularDesconto(valorSemDesconto, 0, 0),
        throwsA(isA<ArgumentError>()));
  });
  test('Deve dar erro ao calcular desconto com valor inicial zero', () {
    expect(() => calcularDesconto(0, 15, 0), throwsA(isA<ArgumentError>()));
  });

  test('Deve dar erro ao calcular com valor inicial negativo', () {
    expect(() => calcularDesconto(-1, 15, 0), throwsA(isA<ArgumentError>()));
  });
}
