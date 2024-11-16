import 'package:dio/dio.dart';
import 'package:stylishecommerce/core/network_service/ApiConstant.dart';
import 'package:stylishecommerce/feature/profile/model/model.dart';

import '../shared/stylishSharedPreferences.dart';

class ProfileService {

final Dio dio;
ProfileService(this.dio);

Future<ProfileModel?> getUser()async{

 try{
   final id = StylishSharedPreferences.getId();
   if(id == null){
     throw Exception('id is not found');
   }
   final response = await dio.get('${ApiConstant.profile}/$id');
   if(response.statusCode == 200 ){
     return ProfileModel.fromJson(response.data);
   }
   else{
     throw Exception('failed to get user ${response.statusCode}');
   }
 }catch(error){
   throw Exception('failed profile $error}');
 }

}

Future<ProfileModel?> updateUser({
    required int userId,
    String? username,
    String? email,
    String? password,
    String? imageUrl,
    Map<String, dynamic>? address,})async{

 try{
   final data = {
     if (username != null) 'username': username,
     if (email != null) 'email': email,
     if (password != null) 'password': password,
     if (imageUrl != null) 'image': imageUrl,
     if (address != null) 'address': address, // Include address if provided
   };
   final response = await dio.put(
       '${ApiConstant.profile}/$userId',
       data: data,
       options: Options(headers:{'Content-Type' : 'application/json'})
   );
   if(response.statusCode == 200 ){
     return ProfileModel.fromJson(response.data);
   }
   else{
     throw Exception('failed to update user ${response.statusCode}/$userId');
   }

 }catch(error){
   throw Exception('failed to update $error');
 }
}
}