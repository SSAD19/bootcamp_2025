
import 'package:bootcampo_extrados_class/commons/widget/appbar_custom.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/bloc/character_bloc.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/widgets/list_character.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: BlocProvider(
        create: (context) => CharacterBloc(getAllCharacterUseCase: GetIt.instance.get()),
        child: ListCharacter(),
      ),
    );
  }
}


