import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weesh/domain/entities/time_slot.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';
import 'package:weesh/presentation/widgets/rect_button.dart';
import 'package:weesh/presentation/widgets/schedule_calendar.dart';
import 'package:weesh/presentation/widgets/title_bar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime focusDate = DateTime.now();
  DateTime currentDate = DateTime.now();

  List<TimeSlot> morningSlots = [
    TimeSlot(time: '8:40'),
    TimeSlot(time: '9:40'),
    TimeSlot(time: '10:40'),
    TimeSlot(time: '11:40'),
    TimeSlot(time: '12:40'),
  ];

  List<TimeSlot> afternoonSlots = [
    TimeSlot(time: '13:40'),
    TimeSlot(time: '14:40'),
    TimeSlot(time: '15:40'),
  ];

  List<TimeSlot> eveningSlots = [
    TimeSlot(time: '16:40'),
    TimeSlot(time: '18:20'),
  ];

  void changeCurrentDate(DateTime newCurrentDate) {
    setState(() {
      currentDate = newCurrentDate;
    });
  }

  void changeFocusDate(DateTime newFocusDate) {
    setState(() {
      focusDate = newFocusDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TitleBar(title: '날짜선택'),
            ),
            SizedBox(height: 24,),
            // 캘린더
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ScheduleCalendar(
                currentDate: currentDate,
                focusDate: focusDate,
                changeCurrentDate: changeCurrentDate,
                changeFocusDate: changeFocusDate,
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Divider(height: 1, color: AppColors.neutral200,),
                  // 시간 선택
                  TitleBar(title: '시간 선택', topPadding: 35,),
                  SizedBox(height: 21,),
                  counselingTimeSelector(),
                  SizedBox(height: 60,),
                  // 버튼들
                  reservationActionSection(),
                ],
              ),
            ),
            SizedBox(height: 44,),
          ],
        ),
      )),
    );
  }

  Widget reservationActionSection() => Row(
    spacing: 10,
    children: [
      Expanded(
        child: RectButton(
          title: '취소',
          function: () => print('취소'),
          backgroundColor: AppColors.neutral200,
          titleColor: AppColors.textSecondary,
          height: 55,
          margin: 0,
        ),
      ),
      Expanded(
        child: RectButton(
          title: '예약보기',
          function: () => print('예약보기'),
          backgroundColor: AppColors.primary,
          titleColor: AppColors.neutralWhite,
          height: 55,
          margin: 0,
        ),
      ),
    ],
  );

  Widget timeSlotItem(TimeSlot item) => Container(
    alignment: Alignment.center,
    width: (MediaQuery.sizeOf(context).width - 50 - 33) / 4,
    height: 33,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(15),

    ),
    child: Text(
      item.time,
      style: AppTextStyles.robotoRegular(size: 12, color: AppColors.textTertiary),
    ),
  );

  Widget timePeriodSection(String title, List<TimeSlot> timeSlots) => Column(
    spacing: 5,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppTextStyles.robotoRegular(size: 12, color: AppColors.textPrimary),
      ),
      Wrap(
        spacing: 11,
        runSpacing: 11,
        children: timeSlots.map((e) => timeSlotItem(e),).toList(),
      ),
    ],
  );

  Widget counselingTimeSelector() => Column(
    spacing: 25,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      timePeriodSection('오전', morningSlots),
      timePeriodSection('오후', afternoonSlots),
      timePeriodSection('방과후, 저녁', eveningSlots),
    ],
  );

}
