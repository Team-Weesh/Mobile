import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({super.key, required this.name, this.width = 0});

  final String name;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/$name.png', width: width == 0
        ? MediaQuery.sizeOf(context).width * 0.16
        : width,);
  }
}
