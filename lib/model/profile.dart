import 'package:proyectofinal_android/model/modelo.dart';


class Comentarios extends Model {

  static String table = 'comentarios_db';

   int id;
    String email;
    String comentario;
    String curp;
  

    Comentarios({
    this.id,
    this.email,
    this.comentario,
    this.curp,

  });

    Map<String, dynamic> toMap() {

        Map<String, dynamic> map = {
            "email": email, 
            "comentario":comentario, 
            "curp":curp,
        };

        if (id != null) { map['id'] = id; }
        return map;
    }

    static Comentarios fromMap(Map<String, dynamic> map) {
        
        return Comentarios(
            id: map['id'],
            email: map['email'].toString(),
            comentario: map['comentario'].toString(),
            curp: map['curp'].toString(),
        );
    }
    Map<String,dynamic> toJson(){
    return {"id" : id, "email" : email, "comentario" : comentario, "curp" : curp};
  }
}
