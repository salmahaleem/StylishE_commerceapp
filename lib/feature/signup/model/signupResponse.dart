class SignupResponse {

  final int id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? age;

  SignupResponse({
        required this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.age
  });

  factory SignupResponse.fromJson(Map<String,dynamic>json){
    return SignupResponse(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
    );
  }

  Map<String,dynamic>toJson(){
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age':age,
    };
  }
}