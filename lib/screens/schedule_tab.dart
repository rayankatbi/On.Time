import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/providers/schedule_provider.dart';
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
    final schedule = Provider.of<ScheduleProvider>(context);
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
                defaultTextStyle: TextStyle(
                  color: Style.white,
                ),
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
            schedule.items.isEmpty
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Style.cardColor,
                    ),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: CustomText(
                      title: 'You didn\'t Have Any Schedule',
                      color: Colors.white,
                    ),
                  )
                : ListView.builder(
                    primary: true,
                    shrinkWrap: true,
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
