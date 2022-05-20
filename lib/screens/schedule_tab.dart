import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/card_schedule.dart';
import 'package:todoapp/widgets/custom_text.dart';

class ScheduleTab extends StatefulWidget {
  ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              calendarStyle: CalendarStyle(
                selectedTextStyle: TextStyle(
                  color: Style.lightMov,
                ),
                defaultTextStyle:TextStyle(
                  color: Style.white,
                ) ,
                weekendTextStyle: TextStyle(color: Colors.red),
                outsideTextStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              headerStyle: HeaderStyle(
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  formatButtonVisible: false,
                  rightChevronVisible: false,
                  leftChevronVisible: false,
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Open Sans',
                  )),
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(1990, 10, 16),
              lastDay: DateTime.utc(2030, 10, 16),
            ),
            CustomText(
              title: 'Schedule',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              size: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
                primary: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return CardSchedule();
                })
          ],
        ),
      ),
    );
  }
}
