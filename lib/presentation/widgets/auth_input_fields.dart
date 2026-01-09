import 'package:flutter/material.dart';
import 'package:weesh/domain/entities/auth_field.dart';
import 'package:weesh/presentation/widgets/text_input_field.dart';

class AuthInputFields extends StatelessWidget {
  const AuthInputFields({
    super.key,
    required this.fields,
    required this.controllers,
  });

  final List<AuthField> fields;
  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        spacing: 30,
        children: List.generate(
          fields.length,
           (index) => TextInputField(
             hintText: fields[index].hintText,
             isPassword: fields[index].isPassword,
             controller: controllers[index],
           ),
        ),
      ),
    );
  }
}
