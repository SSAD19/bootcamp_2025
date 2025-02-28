
import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/widgets/character_details.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/widgets/character_image.dart';
import 'package:flutter/material.dart';

class CardCharacter extends StatelessWidget {
  final CharacterEntity character;
  const CardCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.8,
      height: 200,
      child: Card(
        elevation: 12.5,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CharacterImage(character: character,),
              SizedBox(width: 15),
              CharacterDetails(character: character,),            
            ],
          ),
        ),
      ),
    );
  }
}

