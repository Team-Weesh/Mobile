import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';

class ScheduleCalendar extends StatelessWidget {
  const ScheduleCalendar({
    super.key,
    required this.focusDate,
    required this.currentDate,
    required this.changeCurrentDate,
    required this.changeFocusDate,
  });

  final DateTime focusDate;
  final DateTime currentDate;
  final Function changeCurrentDate;
  final Function changeFocusDate;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return TableCalendar(
      locale: 'ko-KR',
      firstDay: now,
      focusedDay: focusDate,
      lastDay: DateTime.utc(now.year, 12, 31),

      rowHeight: (MediaQuery.sizeOf(context).width - 50) / 7 - 3,
      daysOfWeekHeight: 20,

      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: AppTextStyles.robotoRegular(size: 12, color: AppColors.textPrimary),
        weekendStyle: AppTextStyles.robotoRegular(size: 12, color: AppColors.textPrimary),
      ),

      headerStyle: HeaderStyle(
        leftChevronVisible: false, // 왼쪽 아이콘 삭제
        rightChevronVisible: false, // 오른쪽 아이콘 삭제
        formatButtonVisible: false, // 주, 달 별 포멧 못 바꿈
      ),

      calendarStyle: CalendarStyle(
        outsideDaysVisible: false, // 다른 달 안보임
      ),

      // 선택된 날 인지 확인 후 세팅
      selectedDayPredicate: (day) {
        return isSameDay(currentDate, day);
      },

      onDaySelected: (selectedDay, focusedDay) {
        changeCurrentDate(selectedDay);
        changeFocusDate(focusedDay);
      },

      onPageChanged: (focusedDay) {
        changeFocusDate(focusedDay);
      },

      calendarBuilders: CalendarBuilders(
        // 헤더 디자인
        headerTitleBuilder: (context, day) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Icon(Icons.arrow_back_ios, size: 14, color: AppColors.textTertiary,),
              Text(
                '${day.year}.${day.month.toString().padLeft(2, '0')}',
                style: AppTextStyles.robotoRegular(
                  size: 16,
                  color: AppColors.textPrimary,
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textTertiary,),
            ],
          );
        },
        // 선택 할 수 없는 이번 달
        disabledBuilder: (context, day, focusedDay) {
          return calendarDayCell(day, AppColors.textTertiary);
        },
        // 평일, 주말
        defaultBuilder: (context, day, focusedDay) {
          return calendarDayCell(day, AppColors.textPrimary);
        },
        // 선택된 날
        selectedBuilder: (context, day, focusedDay) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 1.5),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.primary,
                width: 1,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day.day.toString(),
                      style: AppTextStyles.robotoBold(
                        size: 14,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 2,),
                  ],
                ),
                if(isSameDay(now, day))Text(
                  '오늘',
                  style: AppTextStyles.robotoRegular(
                    size: 8,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          );
        },
        // 오늘
        todayBuilder: (context, day, focusedDay) {
          return calendarDayCell(day, AppColors.textPrimary);
        },
      ),
    );
  }

  Widget calendarDayCell(DateTime day, Color textColor) => Container(
    margin: EdgeInsets.symmetric(horizontal: 1.5),
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day.day.toString(),
          style: AppTextStyles.robotoRegular(
            size: 14,
            color: textColor,
          ),
        ),
        SizedBox(height: 2,),
      ],
    ),
  );
}
