import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetails({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name: ${character.name}'), // ${character.name}	
        Text('Specie: ${character.species}'), // ${character.species}
        Text('Status: ${character.status}'), // ${character.status}
                
      ],
    );
  }
}