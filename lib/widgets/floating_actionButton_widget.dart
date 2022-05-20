// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/screens/note_detail.dart';
import 'package:todoapp/screens/schedule_detail.dart';


class FloatingAButton extends StatelessWidget {
  const FloatingAButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: Style.cardColor,
      overlayOpacity: 0.5,
      spacing: 10,
      children: [
        SpeedDialChild(
            backgroundColor: Style.cardColor,
            child: Icon(
              Icons.schedule,
              color: Style.white,
            ),
            label: 'Schedule',
            labelBackgroundColor: Style.cardColor,
            labelStyle: TextStyle(
              fontFamily: 'Open Sanse',
              color: Style.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedulDetail(),
                ),
              );
            }),
        SpeedDialChild(
            backgroundColor: Style.cardColor,
            child: Icon(
              Icons.note,
              color: Style.white,
            ),
            label: 'Note',
            labelBackgroundColor: Style.cardColor,
            labelStyle: TextStyle(
              fontFamily: 'Open Sanse',
              color: Style.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteDetail(),
                ),
              );
            }),
      ],
    );
  }
}
