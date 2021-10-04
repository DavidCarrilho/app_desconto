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
}
