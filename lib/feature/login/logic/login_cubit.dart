import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stylishecommerce/feature/login/model/loginRequestBody_model.dart';
import 'package:stylishecommerce/feature/login/model/loginResponse%20_model.dart';

import '../../../core/network_service/authService.dart';
import '../../../core/shared/stylishSharedPreferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;
  LoginCubit(this.authService) : super(LoginInitial());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPassVisa = false;

  Future<void> login()async{

    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(LoginLoading());

    try {
      final loginBody = LoginRequestBodyModel(
        username: usernameController.text,
        password: passwordController.text,
      );

      final LoginResponseModel? responseModel = await authService.login(loginBody);
      if (responseModel != null) {
        await StylishSharedPreferences.setToken(responseModel.token);
        emit(LoginLoaded(responseModel));
      } else {
        emit(LoginFailure("Login failed: Invalid response or empty token"));
      }
    } on DioException catch (e) {
      emit(LoginFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(LoginFailure("Unexpected error: $e"));
    }
  }

  void toggle(){
    isPassVisa = !isPassVisa;
    emit(LoginPasswordToggle(isPassVisa));
  }

  @override
  Future<void>close(){

    usernameController.dispose();
    passwordController.dispose();

    return super.close();
  }

}
