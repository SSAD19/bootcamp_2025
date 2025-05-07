import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterEntity? character;

  const CharacterDetails({
    super.key,
    this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name: Rick Sanchez'), // ${character.name}	
        Text('Specie: Human'), // ${character.species}
        Text('Status: Alive'), // ${character.status}
                
      ],
    );
  }
}