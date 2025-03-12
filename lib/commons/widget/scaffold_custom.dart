import 'package:bootcampo_extrados_class/commons/widget/appbar_custom.dart';
import 'package:flutter/material.dart';

class ScaffoldCustom extends StatelessWidget {
  final Widget body;
  const ScaffoldCustom({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: body,
    );
  }
}
