part of 'sign_in_bloc.dart';

abstract class SignInEvent {}


class SignInEventLogIn extends SignInEvent {}


class SignInEventLogOut extends SignInEvent {}
