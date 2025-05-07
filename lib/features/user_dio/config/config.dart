import 'package:bootcampo_extrados_class/features/user_dio/data/repositories/user_repository_impl.dart';
import 'package:bootcampo_extrados_class/features/user_dio/data/services/dio_user.dart';
import 'package:bootcampo_extrados_class/features/user_dio/domain/repositories/user_repository.dart';
import 'package:bootcampo_extrados_class/features/user_dio/domain/use_cases/create_user_use_case.dart';
import 'package:bootcampo_extrados_class/features/user_dio/domain/use_cases/get_user_id_use_case.dart';
import 'package:get_it/get_it.dart';

void GetUserConfig() {
  GetIt.instance
      .registerLazySingleton<ApiUser>(() => ApiUser(dioUser: DioUser));

  GetIt.instance.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(apiUser: GetIt.instance.get()));
  // use cases
  GetIt.instance.registerSingleton(
      CreateUserUseCase(userRepository: GetIt.instance.get()));

  GetIt.instance.registerSingleton(
      GetUserIdUseCase(userRepository: GetIt.instance.get()));
}
