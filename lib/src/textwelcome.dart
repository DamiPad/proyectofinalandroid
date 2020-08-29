import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_android/providers/usuarioinfo.dart';

class TextWelcome extends StatelessWidget {
  const TextWelcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioInfo = Provider.of<UsuarioInfo>(context);
   
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(child: Text('Bienvenido ${usuarioInfo.usuario}', style: TextStyle(color: Colors.white, fontSize: 18.0),)),
      ],
    );
  }
}