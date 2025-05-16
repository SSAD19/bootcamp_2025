import 'package:bootcampo_extrados_class/core/network/api_result.dart';
import 'package:bootcampo_extrados_class/core/network/api_service.dart';
import 'package:bootcampo_extrados_class/core/network/failure_base.dart';
import 'package:bootcampo_extrados_class/features/Character/data/repositories/models/character_model.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/repositories/character_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final ApiService apiService;
  CharacterRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<CharacterModel>>> getAllCharacters() async {
    try {
      final result = await apiService.request(
        method: HttpMethod.get,
        url: "character/",
      );

      if (result.resultType == ResultType.failure) {
        return Left(NotFoundFailure('Sorry, an unexpected error occurred.'));
      }
      final List<CharacterModel> characters = (result.body["results"] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList();

      debugPrint(
          'peronaje 1:${characters[0].name},  peronaje 2:${characters[1].name}');
      return Right(characters);
    } on DioException catch (e) {
      return Left(NotFoundFailure(e.message!));
    } catch (e) {
      return Left(NotFoundFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CharacterModel>> getCharacter(int id) async {
    try {
      final result = await apiService.request(
        method: HttpMethod.get,
        url: "character/$id",
      );

      if (result.resultType == ResultType.failure) {
        return Left(NotFoundFailure('Sorry, an unexpected error occurred.'));
      }
      final CharacterModel character = CharacterModel.fromJson(result.body!);
      return Right(character);
    } on DioException catch (e) {
      return Left(NotFoundFailure(e.message!));
    } catch (e) {
      return Left(NotFoundFailure(e.toString()));
    }
  }
}
/*

class CharactersRepositoryImpl implements CharactersRepository {
  final ApiService apiService;
  CharactersRepositoryImpl({required this.apiService});
  @override
  Future<Either<FailureBase, CharacterResult>> getCharacters(
      {required int page}) async {
    try {
      final result = await apiService.request(
        method: HttpMethod.get,
        url: "people/?page=$page",
      );

      if (result.resultType == ResultType.failure) {
        return Left(NotFoundFailure('Sorry, an unexpected error occurred.'));
      }
      final CharacterResult characters = CharacterResult.fromJson(result.body!);
      return Right(characters);
    } on DioException catch (e) {
      return Left(NotFoundFailure(e.message!));
    } catch (e) {
      return Left(NotFoundFailure(e.toString()));
    }
  }
}


home

bloc ---sesion iniciada
--- sin iniciar sesion 
-- error de servidor 


*/
