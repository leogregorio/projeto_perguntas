// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

void main() =>  runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {

  int _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      "pergunta" :"Qual é sua cor favorita?",
      "respostas":["Verde", "Azul", "Amarelo", "Roxo"],
    },
    {
      "pergunta" :"Qual é seu animal favorito?",
      "respostas":["Cavalo", "Cachorro", "Gato", "Onça", "Águia"],
    },
    {
      "pergunta" :"Qual é seu esporte favorito?",
      "respostas":["Handebol", "Futebol", "Golf", "Volei"],
    }
  ];   


  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  } 

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }


  @override
  Widget build(BuildContext context)  {
  List<String> respostas = temPerguntaSelecionada
    ? _perguntas[_perguntaSelecionada].cast()['respostas']
    : [];
        // usando solucao da aula
    //bool temPerguntaSelecionada = _perguntaSelecionada + 1 < _perguntas.length;


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas") ),
        body: 
        temPerguntaSelecionada ? 
        Column(
          children: [
            Questao(_perguntas[_perguntaSelecionada]['pergunta'].toString()),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ) 
        : 
        Center(           
              child: Text(
                "Parabéns!",
                style: TextStyle(fontSize: 34),
                textAlign: TextAlign.center,), 
        ),
      ),
    );
  }
}
    

    // passado para map
    //List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();
    // for(String textoResp in )
    // {
    //   respostas.add(Resposta(textoResp, _responder));
    // }


class PerguntaApp extends StatefulWidget {
 
  _PerguntaAppState createState()
  {
    return _PerguntaAppState();
  }
}
