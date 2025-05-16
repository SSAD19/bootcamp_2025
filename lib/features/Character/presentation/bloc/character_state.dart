part of 'character_bloc.dart';

abstract class CharacterState {}

final class CharacterInitial extends CharacterState {}

final class CharacterLoading extends CharacterState {}

final class CharacterLoaded extends CharacterState {
  final List<CharacterEntity> characters;
  CharacterLoaded(this.characters);
}

final class CharacterError extends CharacterState {
  final String message;
  CharacterError(this.message);
}

final class OneCharacter extends CharacterState {
  final CharacterEntity personaje;

  OneCharacter({required this.personaje});
}
