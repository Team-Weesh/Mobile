import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key, required this.title, required this.heightPadding, required this.function, this.unselected = false});

  final String title;
  final double heightPadding;
  final VoidCallback function;
  final bool unselected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: heightPadding),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: unselected ? AppColors.white : AppColors.primary
        ),
        child: Text(
          title,
          style: unselected
              ? AppTextStyles.robotoRegular(size: 16, color: AppColors.primary)
              : AppTextStyles.robotoSemiBold(size: 20, color: AppColors.white),
        ),
      ),
    );
  }
}
