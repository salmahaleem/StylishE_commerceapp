import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../core/network_service/authService.dart';
import '../../../core/shared/stylishSharedPreferences.dart';
import '../../profile/model/model.dart';
import '../model/signupResponse.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthService authService;
  SignupCubit(this.authService) : super(SignupInitial());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPassVisa = false;

  Future<void> signUp()async{
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(SignupLoading());
    try {
      final signupBody = ProfileModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      final responseModel = await authService.signUp(signupBody);
      if (responseModel != null) {
        await StylishSharedPreferences.setId(responseModel.id);
        emit(SignupLoaded(responseModel));
      } else {
        emit(SignupFailure("signup failed: Invalid response or empty token"));
      }
    } on DioException catch (e) {
      emit(SignupFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(SignupFailure("Unexpected error: $e"));
    }
  }

  void toggle(){
    isPassVisa = !isPassVisa;
    emit(SignupPasswordToggle(isPassVisa));
  }

  @override
  Future<void>close(){

    firstNameController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
