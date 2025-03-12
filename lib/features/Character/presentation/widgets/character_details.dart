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
        DetailText( text: 'Name: ${character.name}'), 	
        DetailText(text:'Specie: ${character.species}'), 
        DetailText(text:'Status: ${character.status}'), 
                
      ],
    );
  }
}

class DetailText extends StatelessWidget {
  final String text; 
  const DetailText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      overflow: TextOverflow.ellipsis); 
  }
}