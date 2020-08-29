import 'package:flutter/material.dart';
import 'package:proyectofinal_android/model/db.dart';
import 'package:proyectofinal_android/model/profile.dart';
import 'package:proyectofinal_android/src/comentarios/add_comentarios.dart';


class ComentariosScreen extends StatefulWidget {
  @override
  _ComentariosScreenState createState() => _ComentariosScreenState();
}

class _ComentariosScreenState extends State<ComentariosScreen> {
  List<Comentarios> _comentarios = [];

  @override
  void initState(){
  
      refresh();
      super.initState(); 

  }
  void refresh() async {
    List<Map<String, dynamic>> _results = await DB.query(Comentarios.table);
    _comentarios = _results.map((item) => Comentarios.fromMap(item)).toList();
    setState(() {});
  }
 

   @override
  Widget build(BuildContext context) {
 return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51, 130, 255, 0.5),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Comentarios'),
          
          FloatingActionButton(
            backgroundColor: Color.fromRGBO(162, 146, 199, 0.8),
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () async {
              await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddComentarios()));
              refresh();
            },
          ),
        ],
      )),
      body: Center(child: ListView(children: _items)),
    );
  }

  List<Widget> get _items => _comentarios.map((item) => _buildListView(item)).toList();

  Widget _buildListView(Comentarios item) {
    return Dismissible(
      key: Key((item.id ?? 0).toString()),
      child: Card(
       
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.email ?? '',style: TextStyle(fontSize: 15)),
                Text('comentario: ' + item.comentario ?? '',style:TextStyle(fontSize: 18,color:Color.fromRGBO(51, 130, 255, 0.5))),
                Text('curp: ' + item.curp ?? '',style:TextStyle(fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Delete', style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Warning'),
                                content: Text(
                                    'Are you sure want to delete this remark ${item.comentario}?'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Si'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _delete(item);
                                    },
                                  ),
                                  FlatButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('No')),
                                ],
                              );
                            });
                      },
                    ),
                    FlatButton(
                        child: Text('Edit', style: TextStyle(color: Colors.blue),),
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddComentarios(
                                        comentario_: item,
                                      )));
                          refresh();
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onDismissed: (DismissDirection direction) => _delete(item),
    );
  }

  void _delete(Comentarios item) async {
    DB.delete(Comentarios.table, item);
    Scaffold.of(this.context)
        .showSnackBar(SnackBar(content: Text('Comentario eliminado')));
    refresh();
  }
    
}



  

  

 