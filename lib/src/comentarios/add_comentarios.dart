import 'package:flutter/material.dart';
import 'package:proyectofinal_android/model/db.dart';
import 'package:proyectofinal_android/model/profile.dart';

//final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddComentarios extends StatefulWidget {
  
  final Comentarios comentario_;
   AddComentarios({this.comentario_});

  @override
  _AddComentariosState createState() => _AddComentariosState();
}


class _AddComentariosState extends State<AddComentarios> {
  
  final _emailController = TextEditingController();
  final _comentarioController = TextEditingController();
  final _curpController = TextEditingController();
    


  @override
  void initState() {
    if (widget.comentario_ != null) {
      _emailController.text = widget.comentario_.email;
      _comentarioController.text = widget.comentario_.comentario;
      _curpController.text = widget.comentario_.curp;
     
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Comentarios'),
        backgroundColor:Color.fromRGBO(162, 146, 199, 0.5),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Padding(padding: EdgeInsets.all(25),),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: _comentarioController,
                decoration: InputDecoration(hintText: 'Comentario'),
              ),
              TextField(
                controller: _curpController,
                decoration: InputDecoration(hintText: 'Curp'),
              ),
              Padding(padding: EdgeInsets.all(25),),
              RaisedButton(
                  child: Text(
                    widget.comentario_ == null ? 'Guardar' : 'Actualizar',
                    style: TextStyle(color: Colors.white,fontSize: 18,),
                  ),
                  onPressed: () {
                    final Comentarios comentario = Comentarios(
                        email: _emailController.text,
                        comentario: _comentarioController.text,
                        curp: _curpController.text);
                    if (widget.comentario_ == null) 
                      _guardar(comentario);
                    else {
                      comentario.id = widget.comentario_.id; 
                      _actualizar(comentario);
                    }
                  },
                color: Colors.orange[600])
            ],
          ),
        ),
      ),
    );
  }

  _guardar(Comentarios item) async {
    await DB.insert(Comentarios.table, item);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Materia agregada con exito!'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              _emailController.text = '';
              _comentarioController.text = '';
              _curpController.text = '';
            
            },
            child: Text('Aceptar'),
          )
        ],
      ),
    );
  }

  _actualizar(Comentarios item) async{ 
    DB.update(Comentarios.table, item);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Se actualizo su comentario'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              _emailController.text = '';
              _comentarioController.text = '';
              _curpController.text = '';
              
            },
            child: Text('Aceptar'),
          )
        ],
      ),
    ).then((value) => Navigator.pop(context));
  }
}
