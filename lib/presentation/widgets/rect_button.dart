import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class RectButton extends StatelessWidget {
  const RectButton({super.key, required this.title, required this.function});

  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: AlignmentGeometry.center,
        padding: EdgeInsetsGeometry.symmetric(vertical: 24),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: AppColors.primary
        ),
        child: Text(title, style: AppTextStyles.robotoSemiBold(size: 20, color: AppColors.whiteColor),),
      ),
    );
  }
}
