import 'package:bootcampo_extrados_class/features/user_dio/domain/entities/user.dart';
import 'package:bootcampo_extrados_class/features/user_dio/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart' show Either;

class GetUserIdUseCase {
  final UserRepository userRepository;

  GetUserIdUseCase({required this.userRepository});

  Future<Either<Failure, User>> call(
      {required String email, required String password}) async {
    return await userRepository.getUserById(
      email: email,
      password: password,
    );
  }
}
