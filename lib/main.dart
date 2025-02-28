import 'package:bootcampo_extrados_class/config/getit_config.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
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
                return Scaffold(body: MyHomePage());
              } else {
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
            },
          )
    );
  }
}



