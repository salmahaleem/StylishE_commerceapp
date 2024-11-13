import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:stylishecommerce/core/network_service/ApiConstant.dart';

import '../../feature/login/model/loginRequestBody_model.dart';
import '../../feature/login/model/loginResponse _model.dart';

class AuthService{
   final Dio dio;

  AuthService(this.dio);

  Future<LoginResponseModel?>login(LoginRequestBodyModel loginRequestBodyModel)async{
   try{
     final response = await dio.post(
         ApiConstant.login,
         data: loginRequestBodyModel.toJson()
     );

     if(response.statusCode==200 && response.data['token'] != null){
       return LoginResponseModel.fromJson(response.data);
     }
     else{
       throw Exception("Failed to login. No token received.");
     }

   }
   catch(error){
     print("unknown error $error");
   }


  }
}