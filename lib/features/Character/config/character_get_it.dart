import 'package:bootcampo_extrados_class/core/network/api_service.dart';
import 'package:bootcampo_extrados_class/core/network/dio_client.dart';
import 'package:bootcampo_extrados_class/features/Character/data/repositories/character_repository_impl.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/repositories/character_repository.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/use_cases/get_character_use_case.dart';
import 'package:get_it/get_it.dart';

void getCharactersConfigure() {

  GetIt.instance.registerLazySingleton<ApiService>(() => ApiService(dioClient)); 

  GetIt.instance.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(apiService: GetIt.instance.get()));

  GetIt.instance.registerSingleton(
    GetCharacterUseCase(repository: GetIt.instance.get()),
  );

}
