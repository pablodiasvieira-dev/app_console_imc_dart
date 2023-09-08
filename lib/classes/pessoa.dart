class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  int _altura = 0;

  void setNome(nome) {
    _nome = nome;
  }

  void setPeso(peso) {
    _peso = peso;
  }

  void setAltura(altura) {
    _altura = altura;
  }

  String getNome() {
    return _nome;
  }

  double getPeso() {
    return _peso;
  }

  int getAltura() {
    return _altura;
  }

  Pessoa(String nome, double peso, int altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  @override
  String toString() {
    return {"Nome ": _nome, "Peso ": _peso, "Altura ": _altura}.toString();
  }
/*
  double calculaImc() {
    double imcDouble = _peso / ((_altura / 100) * (_altura / 100));
    String imcString = imcDouble.toStringAsFixed(2);
    return double.parse(imcString);
  }

  int faixaImc(double imcCalculado) {
    int faixa;
    if (imcCalculado < 16) {
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

  String informaFaixaImc() {
    int faixaIntImc = faixaImc(calculaImc());
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
  */
}
