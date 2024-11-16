import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylishecommerce/core/network_service/profileService.dart';
import 'package:stylishecommerce/feature/profile/model/model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileService profileService;
  ProfileCubit(this.profileService) : super(ProfileInitial());

  ProfileModel? profile;


  Address? selectedAddress;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardTypeController = TextEditingController();
  TextEditingController ibanController = TextEditingController();

  //function to get user
  Future getUser() async{

    try{
      emit(ProfileLoading());

      profile = await profileService.getUser();
      if(profile != null){
        textFieldInput();
        emit(ProfileLoaded(profile!));
      }
      else{
        emit(ProfileFailure('error in profile'));
      }
    }catch(error){
      emit(ProfileFailure('$error'));
    }

  }

  //function to update the profile
  Future updateUser({String? imageUrl}) async{
   try{
     final updatedUser = await profileService.updateUser(
       userId: profile!.id!,
       username: updateValue(profile!.username,usernameController.text),
       email: updateValue(profile!.email,emailController.text ),
       password: updateValue(profile!.password,passwordController.text),
       imageUrl: imageUrl ?? profile!.image,
       //address: selectedAddress?.toUpdateJson(),
     );

     if (updatedUser != null) {
       profile = updatedUser;
       textFieldInput();
       emit(ProfileLoaded(profile!));
     } else {
       emit(ProfileFailure("Failed to update profile."));
     }
   }catch(error){
     emit(ProfileFailure('$error'));
   }

  }

 //function to fill textField in profile
  void textFieldInput(){
    usernameController.text = profile!.username ?? '';
    passwordController.text = profile!.password ?? '';
    emailController.text = profile!.email ?? '';
  }

  //function if profile has any change
  bool changeValue(String? newImageUrl){
    return usernameController.text != (profile?.username ?? '') ||
           passwordController.text != (profile?.password ?? '')||
           emailController.text != (profile?.email ?? '') ||
           newImageUrl != profile?.image;
  }

  //function to update value in the profile
  String? updateValue(String? currentValue,String newValue){
    return newValue.isNotEmpty && newValue != currentValue ? newValue : null;
  }

  // @override
  // Future<void> close() {
  //   usernameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   return super.close();
  // }

}
