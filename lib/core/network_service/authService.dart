import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:stylishecommerce/core/network_service/ApiConstant.dart';
import 'package:stylishecommerce/core/network_service/ErrorService.dart';

import '../../feature/login/model/loginRequestBody_model.dart';
import '../../feature/login/model/loginResponse _model.dart';

class AuthService{
   final Dio dio;

  AuthService(this.dio);

  Future<LoginResponseModel?>login(LoginRequestBodyModel loginRequestBodyModel)async{
   try{
     final url = '${ApiConstant.apiBaseUrl}${ApiConstant.login}';
     final response = await dio.post(
         url,
         data: loginRequestBodyModel.toJson(),
         options: Options(
           headers: {'Content-Type':'application/json'},
           responseType: ResponseType.json,
         ),
     );

     if(response.statusCode==200){
       return LoginResponseModel.fromJson(response.data);
     }
     else{
       throw Exception("Failed to login. No token received.");
     }

   }on DioException catch (e) {
     throw dioErrorHandler(e);
   }
   catch(error){
     print("unknown error $error");
   }


  }
}