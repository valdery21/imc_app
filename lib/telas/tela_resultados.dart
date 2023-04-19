import 'package:flutter/material.dart';
import 'package:imc_app/componentes/cartao_padrao.dart';
import '../constantes.dart';
import '../componentes/botao_inferior.dart';

class TelaResultados extends StatelessWidget {
  const TelaResultados(
      {@required this.resultadoIMC,
      @required this.resultadoTexto,
      @required this.interpretacao,
      Key key})
      : super(key: key);

  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('CALCULADORA IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                //  alignment: Alignment.bottomLeft,
                child: const Text(
                  'Resultado',
                  style: kTituloTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: CartaoPadrao(
              cor: kCorAtivaCartaoPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultadoTexto.toUpperCase(),
                    style: kResultadoTextStyle,
                  ),
                  Text(
                    resultadoIMC,
                    style: kIMCTextStyle,
                  ),
                  Text(
                    interpretacao,
                    textAlign: TextAlign.center,
                    style: kCorpoTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BotaoInferior(
            tituloBotao: 'RECALCULAR',
            aoPressionar: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
