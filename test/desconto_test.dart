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
}
