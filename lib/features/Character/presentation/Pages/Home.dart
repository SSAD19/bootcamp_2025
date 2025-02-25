import 'package:bootcampo_extrados_class/commons/widget/appbar_custom.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: BodyCharacter(),
    );
  }
} 

class BodyCharacter extends StatelessWidget {
  const BodyCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello World'),
    );
  }
}