import 'dart:math';

class CalculadoraIMC {
  CalculadoraIMC({this.altura, this.peso});

  final int altura;
  final int peso;
  double _imc;

//Método para calcular o IMC
  String calcularIMC() {
    _imc = peso / pow(altura / 100, 2);
    _imc.toStringAsFixed(1);
    return _imc.toStringAsFixed(1);
  }

//Método para informar o resultado
  String obterResultado() {
    if (_imc > 30) {
      return 'Obeso';
    } else if (_imc >= 24.9) {
      return 'Acima do peso';
    } else if (_imc > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

//Método para interpretar o resultado
  String obterInterpretacao() {
    if (_imc > 30) {
      return 'Você está obeso. Tenha uma alimentação saudável e se exercite mais. (IMC acima de 30) ';
    } else if (_imc >= 24.9) {
      return 'Você está com o peso acima do normal. Tente se exercitar mais. (IMC entre 25 e 29.9)';
    } else if (_imc > 18.5) {
      return 'Excelente! O seu peso está normal. (IMC entre 18.5 e 24.9)';
    } else {
      return 'Você está com o peso abaixo do normal. Tente comer um pouco mais. (IMC abaixo de 18.4)';
    }
  }
}
