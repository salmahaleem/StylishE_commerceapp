part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;
  ProfileLoaded(this.profileModel);
}

final class ProfileFailure extends ProfileState {
  final String errorMessage;
  ProfileFailure(this.errorMessage);
}

final class ProfileUpdating extends ProfileState {}
