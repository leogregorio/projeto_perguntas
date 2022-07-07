// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart' ;

class Resposta extends StatelessWidget {
  @override
  final String _texto;
  final Function() _pressionar;
  const Resposta(this._texto, this._pressionar);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      
      child: ElevatedButton(
        
        child: Text(_texto),
        onPressed: _pressionar,
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          textStyle: TextStyle(color: Colors.white),
        ),   
      ),
    );    
  }
}