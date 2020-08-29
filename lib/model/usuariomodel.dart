import 'package:proyectofinal_android/model/modelo.dart';

class Usuario extends Model {

    static String table = 'usuario_db';

    int id;
    String nombre;
    String apellidoUno;
    String apellidoDos;
    String curp;
    String foto;

    Usuario({
    this.id,
    this.nombre,
    this.apellidoUno,
    this.apellidoDos,
    this.curp,
    this.foto,

  });

    Map<String, dynamic> toMap() {

        Map<String, dynamic> map = {
            "nombre": nombre, 
            "apellidoUno":apellidoUno, 
            "apellidoDos":apellidoDos,
            "curp": curp,
            "foto": foto,
        };

        if (id != null) { map['id'] = id; }
        return map;
    }

    static Usuario fromMap(Map<String, dynamic> map) {
        
        return Usuario(
            id: map['id'],
            nombre: map['nombre'],
            apellidoUno: map['apellidoUno'],
            apellidoDos: map['apellidoDos'],
            curp: map['curp'],
            foto: map['foto']
        );
    }
}


