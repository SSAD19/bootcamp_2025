import 'package:bootcampo_extrados_class/config/getit_config.dart';
//import 'package:bootcampo_extrados_class/features/Character/presentation/Pages/Home.dart';
import 'package:bootcampo_extrados_class/features/user_dio/presentation/pages/user_pages.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureGetItApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          // Es necesario esperar a que GetIt termine de instanciar las dependencias y no se muestre un error
          future: GetIt.instance.allReady(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return const Scaffold(body: MyHomePage());
              return const Scaffold(
                body: UserPage(),
              );
            } else {
              return const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
            }
          },
        ));
  }
}
