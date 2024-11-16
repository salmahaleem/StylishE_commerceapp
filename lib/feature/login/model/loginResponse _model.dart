class LoginResponseModel{
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String accessToken;
  final String refreshToken;
   LoginResponseModel({
     required this.id,
     required this.username,
     required this.email,
     required this.firstName,
     required this.lastName,
     required this.gender,
     required this.image,
     required this.accessToken,
     required this.refreshToken,
   });

   factory LoginResponseModel.fromJson(Map<String,dynamic>json){
     return LoginResponseModel(
       id: json['id'],
       username: json['username'],
       email: json['email'],
       firstName: json['firstName'],
       lastName: json['lastName'],
       gender: json['gender'],
       image: json['image'],
       accessToken: json['accessToken'],
       refreshToken: json['refreshToken'],
     );

   }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}