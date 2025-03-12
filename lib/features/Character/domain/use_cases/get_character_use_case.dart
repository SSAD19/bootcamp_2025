import 'package:bootcampo_extrados_class/core/network/failure_base.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/repositories/character_repository.dart';
import 'package:dartz/dartz.dart';

class GetCharacterUseCase {

  final CharacterRepository repository;

  GetCharacterUseCase({required this.repository});

  Future<Either<Failure, CharacterEntity>> call(int id) async {
    return await repository.getCharacter(id);
}
  
}