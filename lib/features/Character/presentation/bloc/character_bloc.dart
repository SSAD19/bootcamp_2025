import 'dart:async';

import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/use_cases/get_all_character_use_case.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/use_cases/get_character_use_case.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetAllCharacterUseCase getAllCharacterUseCase;
  final GetCharacterUseCase getOneCharacterUseCase;

  CharacterBloc(
      {required this.getAllCharacterUseCase,
      required this.getOneCharacterUseCase})
      : super(CharacterInitial()) {
    on<CharacterGetAllEvent>(_onGetAllCharacterAllEvent);
    on<CharacterGetByIdEvent>(_onGetOneCharacter);
  }

  Future<void> _onGetAllCharacterAllEvent(
      CharacterGetAllEvent event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());

    final characters = await getAllCharacterUseCase.call();
    return characters.fold(
      (leftError) => emit(CharacterError(leftError.message)),
      (rigthCharacters) => emit(CharacterLoaded(rigthCharacters)),
    );
  }

  FutureOr<void> _onGetOneCharacter(
      CharacterGetByIdEvent event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());

    final character = await getOneCharacterUseCase.call(event.id);

    character.fold((leftError) => emit(CharacterError(leftError.message)),
        (rigthCharacter) => emit(OneCharacter(personaje: rigthCharacter)));
  }
}
