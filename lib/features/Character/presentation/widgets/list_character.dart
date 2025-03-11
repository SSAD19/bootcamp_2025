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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      bloc: context.read<CharacterBloc>()..add(CharacterGetAllEvent()),
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
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.characters.length,
                  itemBuilder: (context, index) {
                    return CardCharacter(character: state.characters[index]);
                  },
                ),
              ),
            ],
          );
        }
        return const Center(
          child: Text('Error with BlocBuilder'),
        );
      },
    );
  }
}
