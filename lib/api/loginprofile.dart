import 'dart:convert';

class UsuarioLogin{
    int id;
    String usuario;
    String password;

    UsuarioLogin({
      this.id,
      this.usuario,
      this.password

    });

    factory UsuarioLogin.fromJson(Map<String, dynamic> map){
      return UsuarioLogin(
        id: map['Id'],
        usuario: map['Usuario'],
        password: map['Password']
      );
    }

    Map<String, dynamic>toJson(){
      return {"Id": id, 
              "Usuario": usuario, 
              "Password": password,
            };
    }

   @override
  String toString(){
    return 'UsuarioLogin {Id: $id, Usuario: $usuario, Password: $password}';
  }
 
    
  




 
}
 List<UsuarioLogin> usuarioLoginFromJson(String jsonData){
    final data = json.decode(jsonData);
    return List<UsuarioLogin>.from(data.map((item)=>
    UsuarioLogin.fromJson(item)));

  }

  String usuarioLoginToJson(UsuarioLogin data){
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }