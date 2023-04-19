import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imc_app/telas/tela_resultados.dart';
import '../componentes/cartao_padrao.dart';
import '../componentes/conteudo_icone.dart';
import '../constantes.dart';
import '../componentes/botao_arredondado.dart';
import '../componentes/botao_inferior.dart';
import 'package:imc_app/calculadora_imc.dart';

enum Sexo {
  masculino,
  feminino,
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo sexoSelecionado;
  int altura = 180;
  int peso = 60;
  int idade = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF484748),
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: const Text('CALCULADORA IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.masculino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.masculino
                        ? kCorAtivaCartaoPadrao
                        : kCorInativaCartaoPadrao,
                    filhoCartao: const ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: 'MASCULINO',
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.feminino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.feminino
                        ? kCorAtivaCartaoPadrao
                        : kCorInativaCartaoPadrao,
                    filhoCartao: const ConteudoIcone(
                      icone: FontAwesomeIcons.venus,
                      descricao: 'FEMININO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CartaoPadrao(
              cor: kCorAtivaCartaoPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'ALTURA',
                    style: kDescricaoTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.toString(),
                        style: kNumeroTextStyle,
                      ),
                      const Text(
                        ' cm',
                        style: kDescricaoTextstyle,
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: const Color(0xFFBF3A19),
                    inactiveColor: const Color(0xFF575657),
                    value: altura.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double novoValor) {
                      setState(() {
                        altura = novoValor.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: CartaoPadrao(
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'PESO',
                          style: kDescricaoTextstyle,
                        ),
                        Text(
                          peso.toString(),
                          style: kNumeroTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BotaoArredondado(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(() {
                                  //peso--;
                                  peso > 0 ? peso-- : peso = 0;
                                });
                              },
                            ),
                            const SizedBox(width: 5.0),
                            BotaoArredondado(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  //peso++;
                                  peso < 150 ? peso++ : peso = 150;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'IDADE',
                          style: kDescricaoTextstyle,
                        ),
                        Text(
                          idade.toString(),
                          style: kNumeroTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BotaoArredondado(
                              icone: FontAwesomeIcons.minus,
                              aoPressionar: () {
                                setState(() {
                                  //idade--;
                                  idade > 0 ? idade-- : idade = 0;
                                });
                              },
                            ),
                            const SizedBox(width: 5.0),
                            BotaoArredondado(
                              icone: FontAwesomeIcons.plus,
                              aoPressionar: () {
                                setState(() {
                                  //idade++;
                                  idade < 100 ? idade++ : idade = 100;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BotaoInferior(
            tituloBotao: 'CALCULAR',
            aoPressionar: () {
              CalculadoraIMC calc = CalculadoraIMC(
                altura: altura,
                peso: peso,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaResultados(
                    resultadoIMC: calc.calcularIMC(),
                    resultadoTexto: calc.obterResultado(),
                    interpretacao: calc.obterInterpretacao(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
