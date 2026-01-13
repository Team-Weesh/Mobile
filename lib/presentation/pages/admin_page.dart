import 'package:flutter/material.dart';
import 'package:weesh/presentation/pages/schedule_page.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';
import 'package:weesh/presentation/widgets/rect_button.dart';
import 'package:weesh/presentation/widgets/title_bar.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleBar(title: '관리자 페이지'),
                SizedBox(height: 40,),
                Text(
                  '예약 상태 안내',
                  style: AppTextStyles.robotoMedium(
                    size: 16,
                    color: AppColors.textTertiary,
                    lineHeight: 16,
                  ),
                ),
                SizedBox(height: 20,),
                bookingStatusGuide(),
              ],
            ),
          ),
          Spacer(),
          RectButton(
            title: '일정보기',
            function: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SchedulePage(),)),
            backgroundColor: AppColors.primary,
            titleColor: AppColors.white,
            height: 55,
            margin: 24,
          ),
          SizedBox(height: 44,),
        ],
      )),
    );
  }

  Widget bookingStatusItem(String title, Color color) => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    spacing: 20,
    children: [
      CircleAvatar(
        radius: 11,
        backgroundColor: color,
      ),
      Text(
        title,
        style: AppTextStyles.robotoMedium(
          size: 14,
          color: AppColors.textPrimary,
          lineHeight: 14,
        ),
      )
    ],
  );

  Widget bookingStatusGuide() => Column(
    spacing: 17,
    children: [
      bookingStatusItem('예약', AppColors.primary),
      bookingStatusItem('예약 승인', AppColors.statusPurple),
      bookingStatusItem('예약 거부', AppColors.statusRed),
      bookingStatusItem('만료된 시간, 날짜', AppColors.statusGrey),
      bookingStatusItem('예약 안됨', AppColors.textPrimary),
    ],
  );
}
