import 'package:flutter/material.dart';

class UsuarioInfo with ChangeNotifier{
  String _usuario;
  get usuario{
    return _usuario;
  }
  set usuario(String nombre){
    this._usuario = nombre;
    notifyListeners();
  }
}