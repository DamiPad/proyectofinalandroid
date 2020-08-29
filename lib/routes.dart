import 'package:flutter/material.dart';
import 'package:proyectofinal_android/src/calificaciones.dart';
import 'package:proyectofinal_android/src/comentarios/add_comentarios.dart';
import 'package:proyectofinal_android/src/comentarios/comentarios.dart';
import 'package:proyectofinal_android/src/graficos/barras_.dart';
import 'package:proyectofinal_android/src/graficos/lineal_.dart';
import 'package:proyectofinal_android/src/home.dart';
import 'package:proyectofinal_android/src/mapa.dart';
import 'package:proyectofinal_android/src/perfil.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/home': (BuildContext context)=>MyHomePage(),
    '/perfil':(BuildContext context)=>PerfilScreen(),
    '/calificaciones':(BuildContext context)=>CalificacionesScreen(),
    '/comentarios':(BuildContext context)=>ComentariosScreen(),
    '/contactanos':(BuildContext context)=>MyMapGoogle(),
    '/lineal':(BuildContext context)=>LinealScreen(),
    '/barras':(BuildContext context)=>BarrasScreen(),
    
  
  };

}