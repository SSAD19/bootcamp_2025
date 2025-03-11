
import 'package:bootcampo_extrados_class/features/SignIn/domain/entity/user_entity.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/repository/local_storage_repository.dart';


class GetUserLocalstorage {
  final LocalStorageRepository _userLocalStorage;

  GetUserLocalstorage({ required LocalStorageRepository userLocalStorage})
      : _userLocalStorage = userLocalStorage;

  Future<UserEntity?> isAuth() async {
    return await _userLocalStorage.read(); 
  }
  
  Future<void> logOut() async{
    return _userLocalStorage.remove(); 
  }

  Future<void> saveUser(UserEntity user) async{
    return _userLocalStorage.save(user);
  }

}
