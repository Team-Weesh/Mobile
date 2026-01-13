import 'package:flutter/material.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
    required this.title,
    this.isPageTitle = false,
    this.topPadding,
  });

  final String title;
  final bool isPageTitle;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? MediaQuery.sizeOf(context).height * 0.03),
      child: Align(
        alignment: AlignmentGeometry.centerLeft,
        child: Text(
          title,
          style: AppTextStyles.robotoBold(
            size: isPageTitle ? 20 : 18,
            color: AppColors.textPrimary,
            lineHeight: 20,
          ),
        ),
      ),
    );
  }
}
