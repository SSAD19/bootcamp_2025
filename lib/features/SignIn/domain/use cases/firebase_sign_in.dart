import 'package:bootcampo_extrados_class/core/network/failure_base.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/entity/user_entity.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/repository/google_auth_repository.dart';
import 'package:dartz/dartz.dart';

class GoogleSignInUseCase {

  final GoogleAuthRepository _firebaseAuthService;
  GoogleSignInUseCase( {required GoogleAuthRepository firebaseAuthService})
      : _firebaseAuthService = firebaseAuthService;

  Future<Either<Failure, UserEntity>> call() async {
    return await _firebaseAuthService.signInWithGoogle();
  }
}
