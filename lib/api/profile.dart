import 'dart:convert';

class Materias{
    int id;
    String materia;
    int calificacion;

    Materias({
      this.id,
      this.materia,
      this.calificacion

    });

    factory Materias.fromJson(Map<String, dynamic> map){
      return Materias(
        id: map['Id'],
        materia: map['Materiaa'],
        calificacion: map['Calificación']
      );
    }

    Map<String, dynamic>toJson(){
      return {"Id": id, 
              "Materiaa": materia, 
              "Calificación": calificacion
            };
    }

   @override
  String toString(){
    return 'Materia {Id: $id, Materiaa: $materia, Calificación: $calificacion}';
  }
 
    
  



}
  List<Materias> materiasFromJson(String jsonData){
    final data = json.decode(jsonData);
    return List<Materias>.from(data.map((item)=>
    Materias.fromJson(item)));

  }

  String materiasToJson(Materias data){
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }