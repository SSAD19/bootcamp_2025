
import 'package:bootcampo_extrados_class/features/SignIn/data/datasource/google_auth_impl.dart';
import 'package:bootcampo_extrados_class/features/SignIn/data/datasource/local_storage_imp.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/repository/google_auth_repository.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/repository/local_storage_repository.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/use%20cases/firebase_sign_in.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/use%20cases/get_user_localstorage.dart';
import 'package:get_it/get_it.dart';

void getAuthConfigure() {
 
  // repositories instances 
  GetIt.instance.registerLazySingleton<LocalStorageRepository>(() => 
  LocalStorageImp());

  GetIt.instance.registerLazySingleton<GoogleAuthRepository>(() => 
  GoogleAuthImpl(userLocalStorage: GetIt.instance.get()));
  
  // use cases instances
  GetIt.instance.registerSingleton(GoogleSignInUseCase(firebaseAuthService: GetIt.instance.get()));
  GetIt.instance.registerSingleton(GetUserLocalstorage(userLocalStorage: GetIt.instance.get()));



}



/*
void getCharactersConfigure() {

  GetIt.instance.registerLazySingleton<ApiService>(()=>ApiService(dioClient));

  GetIt.instance.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(apiService: GetIt.instance.get()));

  //Todos los personajes - all characters
  GetIt.instance.registerSingleton(
    GetAllCharacterUseCase(GetIt.instance.get<CharacterRepository>()),
  );

  // Un personaje - one character
  GetIt.instance.registerSingleton(
    GetCharacterUseCase(repository: GetIt.instance.get()),
  );
*/





