import 'package:bootcampo_extrados_class/commons/widget/appbar_custom.dart';
import 'package:bootcampo_extrados_class/core/network/failure_base.dart';
import 'package:bootcampo_extrados_class/features/Character/data/repositories/character_repository_impl.dart';
import 'package:bootcampo_extrados_class/features/Character/domain/entities.dart/character_entity.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/widgets/card_character.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

   
  //TODO: borrar
  final CharacterRepositoryImpl characterRepositoryImpl = CharacterRepositoryImpl(apiService: GetIt.instance.get());

  @override
  Widget build(BuildContext context) {
    final Future<Either<Failure, List<CharacterEntity>>> characters = characterRepositoryImpl.getAllCharacters();
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          ListCharacter(),
          FutureBuilder<Either<Failure, List<CharacterEntity>>>(
            future: characters,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error");
              } else if (snapshot.hasData) {
                return snapshot.data!.fold(
                  (l) => Text("Error"),
                  (characters) => Column(
                    children: characters.map((character) => Text(character.name)).toList(),
                  ),
                );
              } else {
                return Text("No data");
              }
            },
          ),
        ],
      ),
    );
  }
} 

class ListCharacter extends StatelessWidget {
  const ListCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return CardCharacter();
      },
    );
  }
}