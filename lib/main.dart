// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

void main() =>  runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {

  int _perguntaSelecionada = 0;
  int _pontuacaoAtual = 0;

  final _perguntas = const [
    {
      "pergunta" :"Qual é sua cor favorita?",
      "respostas":[
        {'texto' : 'Verde', 'pontuacao' : 10}, 
        {'texto' : 'Azul', 'pontuacao' : 8}, 
        {'texto' : 'Amarelo', 'pontuacao' : 5}, 
        {'texto' : 'Roxo', 'pontuacao' : 3},
      ],
    },
    {
      "pergunta" :"Qual é seu animal favorito?",
      "respostas":[
        {'texto' : "Cavalo", 'pontuacao' : 10}, 
        {'texto' : "Cachorro", 'pontuacao' : 8}, 
        {'texto' : "Gato", 'pontuacao' : 5}, 
        {'texto' : "Onça", 'pontuacao' : 3}, 
        {'texto' : "Águia", 'pontuacao' : 1},
      ],
    },
    {
      "pergunta" :"Qual é seu esporte favorito?",
      "respostas":[
        {'texto' : "Handebol", 'pontuacao' : 10},
        {'texto' : "Futebol", 'pontuacao' : 8}, 
        {'texto' : "Golf", 'pontuacao' : 5}, 
        {'texto' : "Volei", 'pontuacao' : 2},
      ],
    }
  ];   


  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _pontuacaoAtual += pontuacao;
        _perguntaSelecionada++;
      });

      print(_pontuacaoAtual);
    }
  } 

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }
  
  void _reiniciarQuestionario () {
    setState(() {
      _pontuacaoAtual = 0;
      _perguntaSelecionada = 0;
    });
  }

  @override
  Widget build(BuildContext context)  {
  
        // usando solucao da aula
    //bool temPerguntaSelecionada = _perguntaSelecionada + 1 < _perguntas.length;


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas") ),
        body: 
        temPerguntaSelecionada ?
          Questionario(perguntas: _perguntas, perguntaSelecionada: _perguntaSelecionada, responder: _responder)
        : 
        Resultado(_pontuacaoAtual, _reiniciarQuestionario),
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
