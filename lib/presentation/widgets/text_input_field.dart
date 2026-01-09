import 'package:flutter/material.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({super.key, required this.hintText, required this.isPassword, required this.controller});

  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool isVisible = false;

  void togglePasswordVisibility () {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: AppColors.borderGrey))
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: widget.isPassword,
              controller: widget.controller,
              style: AppTextStyles.robotoRegular(
                size: 16,
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                labelText: widget.hintText,
                labelStyle: AppTextStyles.robotoRegular(
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
              ),
            ),
          ),
          // if (widget.isPassword)
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 5),
          //     child: GestureDetector(
          //       onTap: togglePasswordVisibility,
          //       child: Icon(
          //         isVisible
          //             ? Icons.visibility_off
          //             : Icons.visibility,
          //         color: AppColors.primary,
          //         size: 18,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
