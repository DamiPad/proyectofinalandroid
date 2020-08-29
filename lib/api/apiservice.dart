
import 'package:http/http.dart' show Client;
import 'package:proyectofinal_android/api/profile.dart';

class ApiService{
  final String baseUrl = "https://materiaspf20200827050741.azurewebsites.net";
  Client client = Client();

  Future<List<Materias>> getMaterias() async{
    final response = await client.get('$baseUrl/api/Materias');
    if(response.statusCode == 200){
      return materiasFromJson(response.body);
    }
    else {
      return null;
    }
  }

 

}