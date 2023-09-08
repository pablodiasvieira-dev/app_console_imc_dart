import 'dart:io';

import 'package:meu_app_imc/classes/pessoa.dart';
import 'package:meu_app_imc/exceptions/nome_invalido.dart';
//import 'package:meu_app_imc/exceptions/peso_invalido.dart';
//import 'package:meu_app_imc/exceptions/altura_invalido.dart';
import 'package:meu_app_imc/models/console_utils.dart';

void iniciarPrograma() {
  print("\nIniciando Calculadora de Índice de Massa Corporal - IMC\n");

  String nome = ConsoleUtils.lerStringComTexto("Digite o nome: ").toUpperCase();
  verificaNome(nome);

  double? peso;
  do {
    peso = ConsoleUtils.lerDoubleComTextoComSaida(
        "Digite um Peso (Kg), ou S para sair", "S");
  } while (validaPeso(peso) == false);

  int? altura;
  do {
    altura = ConsoleUtils.lerIntegerComTextoComSaida(
        "Digite uma Altura (cm), ou S para sair", "S");
  } while (validaAltura(altura) == false);

  var pessoa = Pessoa(nome, peso, altura);

  print("\n#------- Resultado do IMC -------#");
  print(
      "${pessoa.getNome()} tem peso de ${pessoa.getPeso()} Kg e altura de ${pessoa.getAltura()} cm.");
  print(
      "+ Índice de Massa Corporal (IMC) é : ${calculaImc(pessoa.getPeso(), pessoa.getAltura())}.");
  print(
      "+ Classificação do IMC: ${informaFaixaImc(pessoa.getPeso(), pessoa.getAltura())}.");
  print("#------- Fim da Execuação --------#\n");
  //print(pessoa);
}

void verificaNome(String nome) {
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    print(NomeInvalidoException);
  } catch (e) {
    print(e);
    exit(0);
  }
}

/*
void verificaPeso(double peso) {
  try {
    if (peso == 0) {
      throw PesoInvalidoException();
    }
  } on PesoInvalidoException {
    print(PesoInvalidoException);
  } catch (e) {
    print(e);
    exit(0);
  }
}

void verificaAltura(int altura) {
  if (altura <= 4) {
    print('A altura precisa ser digitada em centímetros (cm), ex: 165');
  }
  try {
    if (altura == 0) {
      throw AlturaInvalidaException();
    }
  } on AlturaInvalidaException {
    print(AlturaInvalidaException);
  } catch (e) {
    print(e);
    exit(0);
  }
}
*/

bool validaPeso(double peso) {
  if (peso <= 0 || peso >= 300) {
    print("Peso inválido, tente novamente.");
    return false;
  } else {
    return true;
  }
}

bool validaAltura(int altura) {
  if (altura <= 0 || altura >= 300) {
    print("Altura inválida, tente novamente.");
    return false;
  } else {
    return true;
  }
}

double calculaImc(double peso, int altura) {
  if (peso <= 0 || altura <= 0) {
    return 0;
  }
  double imcDouble = peso / ((altura / 100) * (altura / 100));
  String imcString = imcDouble.toStringAsFixed(2);
  return double.parse(imcString);
}

int faixaImc(double imcCalculado) {
  int faixa;
  if (imcCalculado <= 0) {
    faixa = 0;
  } else if (imcCalculado < 16) {
    faixa = 1;
  } else if (imcCalculado < 17) {
    faixa = 2;
  } else if (imcCalculado < 18.5) {
    faixa = 3;
  } else if (imcCalculado < 25) {
    faixa = 4;
  } else if (imcCalculado < 30) {
    faixa = 5;
  } else if (imcCalculado < 35) {
    faixa = 6;
  } else if (imcCalculado < 40) {
    faixa = 7;
  } else {
    faixa = 8;
  }
  return faixa;
}

String informaFaixaImc(peso, altura) {
  int faixaIntImc = faixaImc(calculaImc(peso, altura));
  String faixa;
  switch (faixaIntImc) {
    case 1:
      faixa = "Magreza Grave";
      break;
    case 2:
      faixa = "Magreza Moderada";
      break;
    case 3:
      faixa = "Magreza Leve";
      break;
    case 4:
      faixa = "Magreza Saudável";
      break;
    case 5:
      faixa = "Sobrepeso";
      break;
    case 6:
      faixa = "Obesidade Grau I";
      break;
    case 7:
      faixa = "Obesidade Grau II (severa)";
      break;
    case 8:
      faixa = "Obesidade Grau III (mórbida)";
      break;
    default:
      faixa = "Inválida";
  }
  return faixa;
}
