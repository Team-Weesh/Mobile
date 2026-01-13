import 'package:flutter/material.dart';
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
      body: SafeArea(child: Column(
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
          // 시간 선택
          // 버튼들
        ],
      )),
    );
  }
}
