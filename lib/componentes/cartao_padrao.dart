import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  const CartaoPadrao(
      {Key key, @required this.cor, this.filhoCartao, this.aoPressionar})
      : super(key: key);

  final Color cor;
  final Widget filhoCartao;
  final Function aoPressionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: filhoCartao,
      ),
    );
  }
}
