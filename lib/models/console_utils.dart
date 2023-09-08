import 'dart:convert';
import 'dart:io';

class ConsoleUtils {

  static String lerStringComTexto(String texto) {
    print(texto);
    return lerString();
  }

  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double lerDouble() {
    var value = lerString();
    try {
      return double.parse(value);
    } catch (e) {
      return 0.0;
    }
  }

  static double lerDoubleComTexto(String texto) {
    print(texto);
    return lerDouble();
  }

  static double lerDoubleComTextoComSaida(String texto, String valorSaida) {
    do {
      try {
        var value = lerStringComTexto(texto);
        if (value == valorSaida) {
          exit(0);
        }
        return double.parse(value);
      } catch (e) {
        print("Valor inválido. Utilize as casas decimais, ex: 84.2");
      }
    } while (true);
  }

  static int lerInteger() {
    var value = lerString();
    try {
      return int.parse(value);
    } catch (e) {
      return 0;
    }
  }

  static int lerIntegerComTexto(String texto) {
    print(texto);
    return lerInteger();
  }
  static int lerIntegerComTextoComSaida(String texto, String valorSaida) {
    do {
      try {
        var value = lerStringComTexto(texto);
        if (value == valorSaida) {
          exit(0);
        }
        return int.parse(value);
      } catch (e) {
        print("Valor inválido. Não utilize casas decimais, ex: onde for 1.94 digite 194");
      }
    } while (true);
  }
}
