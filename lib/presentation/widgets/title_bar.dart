import 'package:flutter/material.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.03),
      child: Align(
        alignment: AlignmentGeometry.centerLeft,
        child: Text(
          title,
          style: AppTextStyles.robotoSemiBold(
            size: 20,
            color: AppColors.textPrimary,
            lineHeight: 20,
          ),
        ),
      ),
    );
  }
}
