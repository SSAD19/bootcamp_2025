import 'package:bootcampo_extrados_class/features/SignIn/domain/entity/user_entity.dart';

abstract interface class LocalStorageRepository
 {
  void save(UserEntity user);
  Future<UserEntity?> read();
  void remove(); 
}
