import 'package:flutter/material.dart';

// versao personalizada do botao floatbutton
class BotaoArredondado extends StatelessWidget {
  const BotaoArredondado(
      {Key key, @required this.icone, @required this.aoPressionar})
      : super(key: key);

  final IconData icone;
  final Function aoPressionar;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: aoPressionar,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF575657),
      textStyle: const TextStyle(color: Colors.white),
      child: Icon(icone),
    );
  }
}
