import 'package:flutter/material.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';
import 'package:weesh/presentation/widgets/rect_button.dart';

class AuthActionSection extends StatelessWidget {
  const AuthActionSection({
    super.key,
    required this.actionText,
    required this.navText,
    required this.onPrimaryAction,
    required this.onNavigation,
  });

  final String actionText;
  final String navText;
  final VoidCallback onPrimaryAction;
  final Widget onNavigation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 26,
        children: [
          RectButton(
            title: actionText,
            function: onPrimaryAction,
            backgroundColor: AppColors.lightGrey,
            titleColor: AppColors.textColor,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => onNavigation,)),
            child: Text(
              navText,
              style: AppTextStyles.robotoRegular(
                size: 14,
                color: AppColors.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
