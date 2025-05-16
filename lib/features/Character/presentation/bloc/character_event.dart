part of 'character_bloc.dart';

abstract class CharacterEvent {}

class CharacterInitialEvent extends CharacterEvent {}

class CharacterGetAllEvent extends CharacterEvent {
  CharacterGetAllEvent();
}

class CharacterGetByIdEvent extends CharacterEvent {
  final int id;
  final String name;
  CharacterGetByIdEvent(this.id, this.name);
}
