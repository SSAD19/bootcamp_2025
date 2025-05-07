import 'package:bootcampo_extrados_class/features/user_dio/data/services/dio_user.dart';
import 'package:bootcampo_extrados_class/features/user_dio/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiUser apiUser;

  UserRepositoryImpl({required this.apiUser});

  @override
  Future<Either<Failure, int>> createUser(
      {required String name,
      required String email,
      required String password,
      required String alias}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> getUserById({
    required String email,
    required String password,
  }) async {
    final result = await apiUser.request(
      method: HttpMethod.post,
      url: "user/login",
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result.statusCode == 200) {
      final User user = User.fromJson(result.data);
      return Right(user);
    } else {
      // Manejo de errores
      if (result.statusCode == 404) {
        return Left(
            NotFoundFailure(result.statusMessage ?? 'Usuario no encontrado'));
      } else if (result.statusCode == 401) {
        return Left(NotFoundFailure(
            result.statusMessage ?? 'Credenciales incorrectas'));
      } else if (result.statusCode == 500) {
        return Left(NotFoundFailure(
            result.statusMessage ?? 'Error interno del servidor'));
      } else {
        return Left(
            NotFoundFailure(result.statusMessage ?? 'Error al traer data'));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser({required int id}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<User>>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
