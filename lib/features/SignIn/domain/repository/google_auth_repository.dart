import 'package:bootcampo_extrados_class/core/network/failure_base.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GoogleAuthRepository {
  Future<Either<Failure, UserEntity>> signInWithGoogle();
}
