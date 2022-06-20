// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CustomListTileDateTimePicker extends StatefulWidget {
  CustomListTileDateTimePicker({
    required this.onDateTimeSelected,
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  final void Function(DateTime selectedDate) onDateTimeSelected;

  @override
  State<CustomListTileDateTimePicker> createState() =>
      _CustomListTileDateTimePickerState();
}

class _CustomListTileDateTimePickerState
    extends State<CustomListTileDateTimePicker> {
  DateTime dateTime = DateTime(2022, 6, 16, 5, 30);

  @override
  Widget build(BuildContext context) {
    Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Style.cardColor,
                  onPrimary: Style.white,
                ),
              ),
              child: child!);
        });
    Future<TimeOfDay?> pickTime() {
      return showTimePicker(
          context: context,
          initialTime: TimeOfDay(
            hour: dateTime.hour,
            minute: dateTime.minute,
          ),
          builder: (context, child) {
            return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: Style.cardColor,
                    onPrimary: Style.white,
                    onBackground: Style.lightMov,
                  ),
                ),
                child: child!);
          });
    }

    Future pickDateTime() async {
      DateTime? date = await pickDate();
      if (date == null) return dateTime = DateTime.now();
      TimeOfDay? time = await pickTime();
      if (time == null) return;
      var dateTime1 = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      widget.onDateTimeSelected(dateTime1);
      setState(() => dateTime = dateTime1);
      print(" hour :${dateTime.hour}");
    }

    var trailTitle =
        '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
    return ListTile(
      title: CustomText(
        title: widget.title,
        color: Colors.white,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title: trailTitle,
            color: Style.grey,
            size: 13,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.white,
            ),
            onPressed: pickDateTime,
          ),
        ],
      ),
    );
  }
}
