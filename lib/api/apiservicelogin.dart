
import 'package:http/http.dart' show Client;
import 'package:proyectofinal_android/api/loginprofile.dart';

class ApiServiceLogin{
  final String baseUrl = "https://loginn20200827014913.azurewebsites.net";
  Client client = Client();

  Future<List<UsuarioLogin>> getUsuarioLogin() async{
    final response = await client.get('$baseUrl/api/logins');
    if(response.statusCode == 200){
      return usuarioLoginFromJson(response.body);
    }
    else {
      return null;
    }
  }
 Future<List<UsuarioLogin>> getUsuario(String usuario) async{
    final response = await client.post('$baseUrl/api/logins?Usuario=$usuario');
    if(response.statusCode == 200){
      return usuarioLoginFromJson(response.body);
    }
    else {
      return null;
    }
  }


  

}