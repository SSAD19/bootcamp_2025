import 'package:bootcampo_extrados_class/config/getit_config.dart';
import 'package:bootcampo_extrados_class/core/app_router.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/bloc/character_bloc.dart';
import 'package:bootcampo_extrados_class/features/SignIn/presentation/BLoc/bloc/sign_in_bloc.dart';
import 'package:bootcampo_extrados_class/utils/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
// Import the generated file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instanceFor(app: app);
  configureGetItApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterBloc>(
            create: (BuildContext context) =>
                CharacterBloc(getAllCharacterUseCase: GetIt.instance.get())),
        BlocProvider<SignInBloc>(
            create: (BuildContext context) => SignInBloc(
                googleSignInUseCase: GetIt.instance.get(),
                localstorageSignInUseCase: GetIt.instance.get()))
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: appRoutes,
        title: 'Rick & Morty App',
      ),
    );
  }
}
