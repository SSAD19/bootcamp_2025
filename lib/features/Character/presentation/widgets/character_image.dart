import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';
import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final CharacterEntity character;
  const CharacterImage({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      character.image, //character.image
      height: 100, 
      width: 100,
        fit: BoxFit.fill,
    );
  }
}

