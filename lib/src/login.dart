import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_android/api/apiservicelogin.dart';
import 'package:proyectofinal_android/api/loginprofile.dart';
import 'package:proyectofinal_android/providers/usuarioinfo.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
 class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

 

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ApiServiceLogin apiLoginService;
  final usuarioController=  TextEditingController();
  final passwordController=  TextEditingController();
  
  final bool animate = false;

  @override
    void initState() {
      super.initState();
      apiLoginService = ApiServiceLogin();

    }
 
  @override
  Widget build(BuildContext context) {
    final usuarioInfo = Provider.of<UsuarioInfo>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
          home: Scaffold(
        
            body:  Container(
                    decoration:  BoxDecoration(
                        gradient:  LinearGradient(
                      colors: <Color>[
                        const Color.fromRGBO(162, 146, 199, 0.8),
                        const Color.fromRGBO(51, 51, 63, 0.9),
                      ],
                      stops: [0.2, 1.0],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                    )),
                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                        
                                  children: <Widget>[
                                    TextFormField(
                                      controller: usuarioController,
                                       
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.person_add),
                                          labelText: 'Usuario'
                                        ),
                                        
                                      ),
                                    
                                    Padding(padding: EdgeInsets.all(8.0)),
                                    TextField(
                                      controller: passwordController,
                                       obscureText: true,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.lock_outline),
                                          labelText: 'Password'
                                        ),
                                        
                                      ),
                                    
                                    Padding(padding: EdgeInsets.all(16.0)),
                                    RaisedButton(
                                      
                                      padding: EdgeInsets.all(20.0),
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),),
                                      
                                       onPressed: () async {
                                         print(usuarioController.text);
                                         print(passwordController.text);
                                        
                                        apiLoginService.getUsuario(usuarioController.toString()).then((isSuccess) {
                                          if( isSuccess == null){
                                            usuarioInfo.usuario = usuarioController.text;
                                            Navigator.pushNamed(context,'/home');
                                          }else{
                                            _scaffoldState.currentState.showSnackBar(
                                            SnackBar(
                                              content: Text("Error, the credentials are incorrect"),
                                            )
                                          );
                                          }
                                        });

                                        
                                            
                                          
                                      },
                                    
                                      child: Text("        Loggin         "),
                                    ),
                                    
                                  ],
                                )
            )
          
      ),
    );
  }
}