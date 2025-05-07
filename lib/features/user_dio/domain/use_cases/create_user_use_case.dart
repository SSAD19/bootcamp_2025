import 'package:bootcampo_extrados_class/features/user_dio/domain/repositories/user_repository.dart';

class CreateUserUseCase {
  UserRepository userRepository;

  CreateUserUseCase({required this.userRepository});

  Future<Either<Failure, int>> call(
      {required String name,
      required String email,
      required String password,
      required String alias}) async {
    return await userRepository.createUser(
        name: name, email: email, password: password, alias: alias);
  }
}
