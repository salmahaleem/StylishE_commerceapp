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

Future<ProfileModel?> updateUser(ProfileModel profileModel)async{

 try{
   final response = await dio.put(
       '${ApiConstant.profile}',
       data: profileModel.toJson(),
       options: Options(headers:{'Content-Type' : 'application/json'})
   );
   if(response.statusCode == 200 ){
     return ProfileModel.fromJson(response.data);
   }
   else{
     throw Exception('failed to update user ${response.statusCode}/${profileModel.id}');
   }

 }catch(error){
   throw Exception('failed to update $error');
 }
}
}