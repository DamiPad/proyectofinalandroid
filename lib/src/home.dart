import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_android/providers/usuarioinfo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
 }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Proyecto Final'),
      backgroundColor: Color.fromRGBO(51, 130, 255, 0.5),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/lasalle.jpg'),
                  fit: BoxFit.cover
                )
              ),),
          Text('Revisa tus calificaciones!!', style: TextStyle(fontSize: 30, color:Color.fromRGBO(162, 146, 199, 0.9),),),
          Padding(padding: EdgeInsets.all(16),),
          Container(width:250,child: Text('Uso de Azure, SQLite, Drawer, Provider para un proyecto final en Flutter con Android!',style: TextStyle(fontSize: 15.0)),),
        ],
      ),),
      drawer: DrawerWidget(),
    );
  }
}

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


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioInfo = Provider.of<UsuarioInfo>(context);
   
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: TextWelcome(),
              decoration: BoxDecoration(
                color: Color.fromRGBO(162, 146, 199, 0.6),
              ),
            ),
            ListTile(
              title: Text('Perfil'),
              onTap: () {

                Navigator.pushNamed(context,'/perfil');
              },
            ),
            ListTile(
              title: Text('Calificaciones'),
              onTap: () {
                Navigator.pushNamed(context,'/calificaciones');
              },
            ),
            ListTile(
              title: Text('Comentarios'),
              onTap: () {
                Navigator.pushNamed(context,'/comentarios');
              },
            ),
            ListTile(
              title: Text('Contactanos'),
              onTap: () {
                Navigator.pushNamed(context,'/contactanos');
              },
            ),
          ],
        ),
      );
  }
}
