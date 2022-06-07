// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_listtile.dart';
import 'package:todoapp/widgets/custom_text.dart';
import 'package:todoapp/widgets/custom_textfield.dart';

class SchedulDetail extends StatefulWidget {
  SchedulDetail({Key? key}) : super(key: key);

  @override
  State<SchedulDetail> createState() => _SchedulDetailState();
}

class _SchedulDetailState extends State<SchedulDetail> {
  bool checkedValue = false;
  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    bool isSwiched = false;
    return Scaffold(
      backgroundColor: Style.mov,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Checkbox(
              // checkColor: Colors.white,
              side: BorderSide(
                color: Colors.white,
                width: 2,
              ),
              activeColor: Colors.transparent,
              value: checkedValue,
              onChanged: (value) {
                setState(() {
                  checkedValue = value!;
                });
              }),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.assignment_turned_in_outlined,
              color: Style.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: 'Schedule',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              size: 20,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              txtEditingController: scheduleController,
              hintTxt: 'Meeting with anomale team',
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            ListTile(
              title: CustomText(
                title: 'Fullday',
              ),
              trailing: Switch(
                activeColor: Style.lightMov,
                value: isSwiched,
                onChanged: (bool value) {
                  setState(() {
                    isSwiched = value;
                  });
                },
              ),
            ),
            CustomListTile(title: 'Start From', trailTitle: 'date/time'),
            CustomListTile(title: 'Finish', trailTitle: 'date/time'),
            CustomListTile(title: 'Repeat', trailTitle: 'None'),
            CustomListTile(title: 'Reminder', trailTitle: 'Befor 5 minutes'),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomTextField(
                txtEditingController: locationController,
                hintTxt: 'Location',
                keyboardType: TextInputType.text,
              ),
            ),
            CustomTextField(
              txtEditingController: noteController,
              hintTxt: 'Note',
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
