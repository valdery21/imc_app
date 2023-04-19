import 'package:flutter/material.dart';
import 'telas/tela_principal.dart';

void main() => runApp(const CalculadoraIMC());

class CalculadoraIMC extends StatelessWidget {
  const CalculadoraIMC({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF484748),
          secondary: const Color(0xFFC86F05),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromARGB(255, 122, 137, 179),
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color(
              0xFFFFFFFF,
            ),
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF484748),
      ),
      home: const TelaPrincipal(),
    );
  }
}
