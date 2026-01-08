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
      padding: EdgeInsetsGeometry.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: AppColors.lineColor))
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: isVisible,
              controller: widget.controller,
              style: AppTextStyles.robotoRegular(size: 18, color: AppColors.textColor),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppTextStyles.robotoRegular(size: 18, color: AppColors.primary),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          if (widget.isPassword)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: togglePasswordVisibility,
                child: Icon(
                  isVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.primary,
                  size: 18,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
