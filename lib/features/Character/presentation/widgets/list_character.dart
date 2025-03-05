import 'package:bootcampo_extrados_class/features/Character/presentation/bloc/character_bloc.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/widgets/card_character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCharacter extends StatefulWidget {
  const ListCharacter({super.key});

  @override
  State<ListCharacter> createState() => _ListCharacterState();
}

class _ListCharacterState extends State<ListCharacter> {
  late CharacterBloc _blocCharacter;

  @override
  void initState() {
    _blocCharacter = context.read<CharacterBloc>()..add(CharacterGetAllEvent());
    super.initState();
  }

  @override
  void dispose() {
    _blocCharacter.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoading || state is CharacterInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CharacterError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is CharacterLoaded) {
  
          return ListView.builder(
            itemCount: state.characters.length,
            itemBuilder: (context, index) {
              return CardCharacter(character: state.characters[index]);
            },
          );
        }
        return const Center(
          child: Text('Error with BlocBuilder'),
        );


      },
    );
  }
}
