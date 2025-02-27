

import 'package:bootcampo_extrados_class/core/network/failure_base.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/repositories/character_repositoy.dart';
import 'package:dartz/dartz.dart';

class GetAllCharacterUseCase {
  final CharacterRepository repository;

  GetAllCharacterUseCase(this.repository);

  Future<Either<Failure, List<CharacterEntity>>> call() async {
    return await repository.getAllCharacters();
  }



}