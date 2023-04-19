import 'package:flutter/material.dart';
import '../constantes.dart';

class BotaoInferior extends StatelessWidget {
  const BotaoInferior({Key key, @required this.aoPressionar, this.tituloBotao})
      : super(key: key);

  final Function aoPressionar;
  final String tituloBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        // ignore: sort_child_properties_last
        child: Center(
          child: Text(
            tituloBotao,
            style: kBotaoGrandeTextStyle,
          ),
        ),
        color: kCorContainerInferior,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 1.0),
        width: double.infinity,
        height: kAlturaContainerInferior,
      ),
    );
  }
}
