import 'package:bootcampo_extrados_class/commons/widget/scaffold_custom.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          // Es necesario esperar a que GetIt termine de instanciar las dependencias y no se muestre un error
          future: GetIt.instance.allReady() , 
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MyHomePage();              
            } else {      
              return const ScaffoldCustom(
                  body: Center(child: CircularProgressIndicator()));
            }
          },
        );
  }
}