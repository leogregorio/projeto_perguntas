// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart' ;
class Resultado extends StatelessWidget {

  final int _notaFinal;
  final void Function() _funcReset;
  Resultado(this._notaFinal, this._funcReset);


  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: prefer_const_constructors
        Center(           
          // ignore: prefer_const_constructors
          child:
          ( 
            Text(
              "Parabéns!\nSua pontuação foi: ${_notaFinal}",
              style: TextStyle(fontSize: 34),
              textAlign: TextAlign.center,)
          )),   
        TextButton(
          child: Text("Reiniciar quiz"),
          onPressed: _funcReset,
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            textStyle: TextStyle(color: Colors.white),
          ),
        ),                 
            
      ],
    );
  }
}