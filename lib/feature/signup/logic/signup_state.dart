part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupLoaded extends SignupState {
  SignupResponse signupResponse;
  SignupLoaded(this.signupResponse);
}

final class SignupFailure extends SignupState {
  final String errorMessage;
  SignupFailure(this.errorMessage);
}

final class SignupPasswordToggle extends SignupState {
  final bool isPasswordVisable;
  SignupPasswordToggle(this.isPasswordVisable);
}