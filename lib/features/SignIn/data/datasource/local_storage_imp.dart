import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:bootcampo_extrados_class/features/SignIn/domain/entity/user_entity.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/repository/local_storage_repository.dart';

class LocalStorageImp implements LocalStorageRepository{


 static const String userKey = "USER";

 
  @override
  Future<UserEntity?> read()async {
    final pref = await SharedPreferences.getInstance();
    final user = pref.getString(userKey);
    if (user != null) {
      final userMap = jsonDecode(user);
      return UserEntity.fromJson(userMap);
    }
    return null;
  }
  
  @override
  void save(UserEntity user) async {
  final pref = await SharedPreferences.getInstance();
    await pref.setString(userKey, jsonEncode(user.toJson()));
  }
  
  @override
  void remove() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear(); 
    
  }
}


