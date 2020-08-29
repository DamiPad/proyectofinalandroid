import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal_android/model/db.dart';
import 'package:proyectofinal_android/model/usuariomodel.dart';
import 'package:proyectofinal_android/providers/usuarioinfo.dart';

class PerfilScreen extends StatefulWidget {
  //PerfilScreen({Key key}) : super(key: key);
  final Usuario usuario_;
   PerfilScreen({this.usuario_});


  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final _emailController = TextEditingController();
  final _apellidoUnoController = TextEditingController();
  final _apellidoDosController = TextEditingController();
  final _curpUnoController = TextEditingController();
  
  @override
  void initState() {
  

      print(DB.query(Usuario.table));
    if (widget.usuario_ != null) {
      //DB.query(Usuario.table);
      print(DB.query(Usuario.table));
      _emailController.text = widget.usuario_.nombre;
      _apellidoUnoController.text = widget.usuario_.apellidoUno;
      _apellidoDosController.text = widget.usuario_.apellidoDos;
      _curpUnoController.text=widget.usuario_.curp;
     
      super.initState();
    }
  }

  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final usuarioInfo = Provider.of<UsuarioInfo>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Perfil'),
      
      backgroundColor: Color.fromRGBO(51, 130, 255, 0.5),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[

            Container(
              height: 200,
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo.jpg'),
                  fit: BoxFit.cover
                )
              ),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    
                    child:CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.yellow,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/yo.jpg'),
                          )
                        ),
                         
                      
                    
                  
                  ),
                   Container(
                     height: 20,
                     width: 20,
                     child: FloatingActionButton(
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
                      onPressed: () {
                        _showSelectionDialog(context);
                      },
                      child: Icon(Icons.photo_camera, size: 20, color: Colors.white,),
                  ),
                   ),
                  Text(usuarioInfo.usuario, style:TextStyle(color: Colors.white))

                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top:40),),
           
            Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Container(
                    width: 300,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                       hintText: 'Email'
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:16),),
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                       hintText: 'Nombre'
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:16),),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: _apellidoUnoController,
                      decoration: InputDecoration(
                        hintText: 'Apellido Paterno'
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:16),),

                   Container(
                     width: 300,
                     child: TextField(
                       controller: _apellidoDosController,
                      decoration: InputDecoration(
                        hintText: 'Apellido Materno'
                      ),
                  ),
                   ),
                   Padding(padding: EdgeInsets.only(top:16),),
                   Container(
                     width: 300,
                     child: TextField(
                       controller: _curpUnoController,
                      decoration: InputDecoration(
                        hintText: 'Curp'
                      ),
                  ),
                   ),
                  ],
                ),),

                Padding(padding: EdgeInsets.all(16.0)),
                Container(
                  width: 400,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20.0),
                    color: Color.fromRGBO(162, 146, 199, 0.8),
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),),
                          onPressed: ()async{
                          final Usuario usuario = Usuario(
                            nombre: _emailController.text,
                            apellidoUno:_apellidoUnoController.text,
                            apellidoDos: _apellidoDosController.text,
                            curp: _curpUnoController.text,
                            foto: 'assets/yo.jpg');
                            
                            //await DB.insert(Usuario.table, usuario);
                            await DB.update(Usuario.table, usuario);
                                
                                        
                          },
                     child: Text("Guardar Cambios"),
                   ),
                ),
              
          
          ],
        ),
      ),
     
    );
  }
}

Future<void> _showSelectionDialog(BuildContext context) {
  final picker = ImagePicker();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("De donde quiere tomar su foto?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Galeria"),
                      onTap: () async{
                        final pickedFile = await picker.getImage(source: ImageSource.gallery);
                          print(pickedFile);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camara"),
                      onTap: () async{
                        
                          final pickedFile = await picker.getImage(source: ImageSource.camera);
                          print(pickedFile);
                          //imageBase64 = pickedFile.path;
                                        
                      },
                    )
                  ],
                ),
              ));
        });
  
  
}