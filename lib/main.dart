import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_android/model/db.dart';
import 'package:proyectofinal_android/providers/usuarioinfo.dart';
import 'package:proyectofinal_android/routes.dart';
import 'package:proyectofinal_android/src/login.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
            create: (context) => UsuarioInfo(),
            child: MaterialApp(
              title: 'Login App',
              routes: getApplicationRoutes(),
              home: LoginScreen(),
          
        
    ),
     );
  }
}

