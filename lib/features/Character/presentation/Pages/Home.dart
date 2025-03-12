import 'package:bootcampo_extrados_class/commons/widget/scaffold_custom.dart';
import 'package:bootcampo_extrados_class/features/Character/presentation/widgets/list_character.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      body: ListCharacter(),
    );
  }
}
