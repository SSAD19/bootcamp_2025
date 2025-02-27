import 'package:bootcampo_extrados_class/core/network/failure_base.dart';
import 'package:dartz/dartz.dart';

import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';

abstract interface class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> getAllCharacters();
  Future<Either<Failure, CharacterEntity>> getCharacter(int id);
}

