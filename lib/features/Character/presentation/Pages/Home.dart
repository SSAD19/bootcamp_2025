import 'package:bootcampo_extrados_class/commons/widget/appbar_custom.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/widgets/card_character.dart';

import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: CustomAppbar(),
      body: ListCharacter(),
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