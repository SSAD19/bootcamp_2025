part of 'sign_in_bloc.dart';

abstract class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInLoaded extends SignInState {
  final UserEntity user;

  SignInLoaded({required this.user});
}

final class SignInError extends SignInState {
  final String message;

  SignInError({required this.message});
}
