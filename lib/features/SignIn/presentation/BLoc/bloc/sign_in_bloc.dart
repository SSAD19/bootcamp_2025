import 'package:bootcampo_extrados_class/features/SignIn/domain/entity/user_entity.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/use%20cases/firebase_sign_in.dart';
import 'package:bootcampo_extrados_class/features/SignIn/domain/use%20cases/get_user_localstorage.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  //localstorage usecase
  //google auth usecase
  bool sesionInit = false;
  GoogleSignInUseCase googleSignInUseCase;
  GetUserLocalstorage localstorageSignInUseCase;

  SignInBloc(
      {required this.googleSignInUseCase,
      required this.localstorageSignInUseCase})
      : super(SignInInitial()) {
    on<SignInEventLogIn>((_onSignInEventLogIn));
    on<SignInEventLogOut>((_onSignInEventLogOut));
  }

  void _onSignInEventLogIn(
      SignInEventLogIn event, Emitter<SignInState> emit) async {
    emit(SignInLoading());

    final authUser = await localstorageSignInUseCase.isAuth();

    if (authUser == null) {
      final failOrLogin = await googleSignInUseCase.call();

      failOrLogin.fold((l) => emit(SignInError(message: l.message)), (r) {
        localstorageSignInUseCase.saveUser(r);
        sesionInit = true;
        emit(SignInLoaded(user: r));
      });
    } else {
      sesionInit = false;
      emit(SignInLoaded(user: authUser));
    }
  }

  void _onSignInEventLogOut(
      SignInEventLogOut event, Emitter<SignInState> emit) {
    try {
      localstorageSignInUseCase.logOut();
      emit(SignInInitial());
      sesionInit = false;
    } catch (e) {
      emit(SignInError(message: e.toString()));
    }
  }
}
