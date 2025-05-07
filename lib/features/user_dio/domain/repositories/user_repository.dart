import 'package:bootcampo_extrados_class/core/network/failure_base.dart';
import 'package:bootcampo_extrados_class/features/user_dio/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

export 'package:bootcampo_extrados_class/core/network/failure_base.dart';
export 'package:bootcampo_extrados_class/features/user_dio/domain/entities/user.dart';
export 'package:dartz/dartz.dart';

abstract interface class UserRepository {
  Future<Either<Failure, int>> createUser(
      {required String name,
      required String email,
      required String password,
      required String alias});
  Future<Either<Failure, User>> updateUser({required User user});
  Future<Either<Failure, bool>> deleteUser({required int id});
  Future<Either<Failure, User>> getUserById(
      {required String email, required String password});
  Future<Either<Failure, List<User>>> getAllUsers();
}
