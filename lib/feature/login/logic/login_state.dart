part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
  LoginResponseModel responseModel;
  LoginLoaded(this.responseModel);
}

final class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

final class LoginPasswordToggle extends LoginState {
  final bool isPasswordVisable;
  LoginPasswordToggle(this.isPasswordVisable);
}


