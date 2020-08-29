import 'dart:async';
import 'package:proyectofinal_android/model/modelo.dart';
import 'package:proyectofinal_android/model/profile.dart';
import 'package:sqflite/sqflite.dart';


class DB {

 static Database _db;

    static int get _version => 1;

    static Future<void> init() async {

        if (_db != null) { return; }

        try {
            String _path = await getDatabasesPath() + 'databasedos';
            _db = await openDatabase(_path, version: _version, onCreate: onCreate);
        }
        catch(ex) { 
            print(ex);
        }
    }

    static void onCreate(Database db, int version) async{
      await db.execute('CREATE TABLE usuario_db (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nombre STRING, apellidoUno STRING, apellidoDos STRING, curp STRING, foto STRING)');
      await db.execute('CREATE TABLE comentarios_db (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, email STRING, comentario STRING, curp STRING)');
    
    }
    static Future<List<Map<String, dynamic>>> query(String table) async => _db.query(table);

    static Future<int> insert(String table, Model model) async =>
        await _db.insert(table, model.toMap());
    
    static Future<int> update(String table, Model model) async =>
        await _db.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

    static Future<int> delete(String table, Model model) async =>
        await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);


     static Future<List<Comentarios>> getComentarios() async{
       List<Comentarios> _tasks = [];

        List<Map<String, dynamic>> _results = await DB.query(Comentarios.table);
        _tasks = _results.map((item) => Comentarios.fromMap(item)).toList();
       return _tasks;
    
  }

   static Future<List<Comentarios>> getUsuarioss() async{
       List<Comentarios> _tasks = [];

        List<Map<String, dynamic>> _results = await DB.query(Comentarios.table);
        _tasks = _results.map((item) => Comentarios.fromMap(item)).toList();
       return _tasks;
    
  }
    
}
