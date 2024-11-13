class LoginRequestBodyModel{
  final String username;
  final String password;

  LoginRequestBodyModel({required this.username,required this.password});

  Map<String,dynamic>toJson(){
    return {
    "username" : username,
    "password" : password,
   };
  }
}