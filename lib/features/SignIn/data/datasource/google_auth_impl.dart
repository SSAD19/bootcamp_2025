import 'package:bootcampo_extrados_class/core/network/failure_base.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/entity/user_entity.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/repository/google_auth_repository.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/repository/local_storage_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GoogleAuthImpl implements GoogleAuthRepository{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final String msgCodeError = 'El código provisto es incorrecto';
  final String msgPhoneError = 'El número provisto no es correcto';
  final String msgUserError = 'Usuario no autenticado';
  final LocalStorageRepository userLocalStorage;

  GoogleAuthImpl({required this.userLocalStorage});



  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    
 final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();


    if (googleSignInAccount == null) {
      return Left(UnknownFailure(msgUserError));
    }

    try {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final User? user = await _signInWithCredential(credential);
      if (user != null) {
        final userFb = UserEntity(
            email: user.email ?? '',
            userName: user.displayName ?? "",
            uid: user.uid);
        _saveUser(userFb);
        return Right(userFb);
      } else {
        return Left(UnknownFailure(msgUserError));
      }
    } on FirebaseAuthException catch (_) {
      return Left(UnknownFailure(msgUserError));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }

  }

  Future<User?> _signInWithCredential(AuthCredential credential) async {
    return (await firebaseAuth.signInWithCredential(credential)).user!;
  }

  Future<void> _saveUser(UserEntity user) async {
    userLocalStorage.save(user);
  }

}