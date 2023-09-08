import 'package:meu_app_imc/meu_app_imc.dart';
import 'package:test/test.dart';

void main() {
  test('Função que Calcula IMC - teste 1', () {
    expect(calculaImc(100, 178), 31.56);
  });
  test('Função que Calcula IMC - teste de zeros', () {
    expect(calculaImc(0, 0), 0);
  });
  test('Função que Faixa Inteira do IMC - teste 1', () {
    expect(faixaImc(31.56), 6);
  });
  test('Função que Faixa Inteira do IMC - teste de zeros', () {
    expect(faixaImc(0), 0);
  });
  test('Função que Informar Faixa do IMC - teste 1', () {
    expect(informaFaixaImc(100.0, 178), "Obesidade Grau I");
  });
  test('Função que Informar Faixa do IMC - extremo inferior', () {
    expect(informaFaixaImc(48.4, 178), "Magreza Grave");
  });
  test('Função que Informar Faixa do IMC - extremo superior', () {
    expect(informaFaixaImc(147.0, 162), "Obesidade Grau III (mórbida)");
  });
  test('Função que Informar Faixa do IMC - limite da faixa', () {
    expect(informaFaixaImc(83.88, 167), "Obesidade Grau I");
  });
    test('Função que Informar Faixa do IMC - teste de zero', () {
    expect(informaFaixaImc(0.0, 0), "Inválida");
  });
}
