import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/use_cases/get_all_character_use_case.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {

  final GetAllCharacterUseCase getAllCharacterUseCase;

  CharacterBloc({required this.getAllCharacterUseCase}) : super(CharacterInitial()) {
    on<CharacterGetAllEvent>(_onGetAllCharacterAllEvent);
  }

Future<void> _onGetAllCharacterAllEvent(CharacterGetAllEvent event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());
    final characters = await getAllCharacterUseCase.call();
    return characters.fold(
      (leftError) => emit(CharacterError(leftError.message)),
      (rigthCharacters) => emit(CharacterLoaded(rigthCharacters)),
    ); 
   
  }

  
}
