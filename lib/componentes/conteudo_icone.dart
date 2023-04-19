import 'package:flutter/material.dart';
import '../constantes.dart';

class ConteudoIcone extends StatelessWidget {
  const ConteudoIcone({Key key, this.icone, this.descricao}) : super(key: key);

  final IconData icone;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(icone, size: 45.0, color: Colors.white),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          descricao,
          style: kDescricaoTextstyle,
        )
      ],
    );
  }
}
