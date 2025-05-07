part of 'user_bloc.dart';

abstract class UserEvent {}

class UserRegisterEvent extends UserEvent {
  final String email;
  final String password;
  final String name;
  final String alias;

  UserRegisterEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.alias,
  });
}

class UserLoginEvent extends UserEvent {
  final String email;
  final String password;

  UserLoginEvent({
    required this.email,
    required this.password,
  });
}

class UserLogoutEvent extends UserEvent {}
