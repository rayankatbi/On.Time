// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/models/schedule_model.dart';
import 'package:todoapp/providers/schedule_provider.dart';
import 'package:todoapp/widgets/custom_listtile.dart';
import 'package:todoapp/widgets/custom_listtile_date_time_picker.dart';
import 'package:todoapp/widgets/custom_text.dart';
import 'package:todoapp/widgets/custom_textfield.dart';

class SchedulDetail extends StatefulWidget {
  SchedulDetail({
    Key? key,
    this.schedule,
  }) : super(key: key);

  Schedule? schedule;
  @override
  State<SchedulDetail> createState() => _SchedulDetailState();
}

class _SchedulDetailState extends State<SchedulDetail> {
  final TextEditingController scheduleTitleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  bool isSwitch = false;

  @override
  void dispose() {
    scheduleTitleController.dispose();
    locationController.dispose();
    noteController.dispose();
    super.dispose();
  }
  late CustomListTileDateTimePicker  dateTimePicker;

  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<ScheduleProvider>(context);

    return Scaffold(
      backgroundColor: Style.mov,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Style.white,
            ),
            onPressed: () {

              schedule.addSchedule(
                Schedule(
                  title: scheduleTitleController.text,
                  isFullDay: isSwitch,
                  startDate: startDate,
                  endDate: endDate,
                  place: locationController.text,
                  note: noteController.text,
                  isChecked: false,
                  reminder: "Reminder",
                  repeat: ,
                ),

               );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: 'Schedule',
                color: Colors.white,
                fontWeight: FontWeight.w600,
                size: 20,
              ),
              SizedBox(height: 10),
              CustomTextField(
                txtEditingController: scheduleTitleController,
                hintTxt: 'Shchedule Title',
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              ListTile(
                title: CustomText(
                  title: 'Fullday',
                  color: Colors.white,
                ),
                trailing: Switch(
                  activeColor: Style.lightMov,
                  inactiveTrackColor: Style.darkMov,
                  value: isSwitch,
                  onChanged: (value) => setState(() {
                    isSwitch = value;
                  }),
                ),
              ),
              CustomListTileDateTimePicker(
                title: 'Start From',
              ),
              CustomListTileDateTimePicker(
                title: 'Finish',
              ),
              CustomListTile(
                title: 'Repeat',
                //trailTitle: 'None',
              ),
              ListTile(
                title: CustomText(
                  title: 'Reminder',
                  color: Colors.white,
                ),
                //  trailTitle: 'Befor 5 minutes',
              ),
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
      ),
    );
  }
}
