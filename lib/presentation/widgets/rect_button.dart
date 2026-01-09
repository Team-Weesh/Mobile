import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class RectButton extends StatelessWidget {
  const RectButton({
    super.key,
    required this.title,
    required this.function,
    required this.backgroundColor,
    required this.titleColor,
    this.height = 47,
    this.margin = 35,
  });

  // 필수 요소
  final String title;
  final VoidCallback function;
  final Color backgroundColor;
  final Color titleColor;

  final double height;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: margin),
        width: double.infinity,
        height: height,
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
