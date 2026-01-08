import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class RectButton extends StatelessWidget {
  const RectButton({super.key, required this.title, required this.function, required this.backgroundColor, required this.titleColor});

  final String title;
  final VoidCallback function;
  final Color backgroundColor;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: AlignmentGeometry.center,
        margin: EdgeInsetsGeometry.symmetric(horizontal: 35),
        width: double.infinity,
        height: 47,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Text(
          title,
          style: AppTextStyles.robotoSemiBold(size: 16, color: titleColor),
        ),
      ),
    );
  }
}
