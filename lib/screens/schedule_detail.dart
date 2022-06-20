// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    this.schedulee,
  }) : super(key: key);

  Schedule? schedulee;
  @override
  State<SchedulDetail> createState() => _SchedulDetailState();
}

class _SchedulDetailState extends State<SchedulDetail> {
  late final TextEditingController scheduleTitleController =
      TextEditingController(text: widget.schedulee?.title);
  late final TextEditingController locationController =
      TextEditingController(text: widget.schedulee?.place);
  late final TextEditingController noteController =
      TextEditingController(text: widget.schedulee?.note);
  bool isSwitch = false;
  late DateTime _startDate = DateTime.now(), _endDate = DateTime.now();
  List _selectedDays = [];

  @override
  void dispose() {
    scheduleTitleController.dispose();
    locationController.dispose();
    noteController.dispose();
    super.dispose();
  }

  Future showdialog1(BuildContext context, int indexId) async {
    final scheduleProvider =
        Provider.of<ScheduleProvider>(context, listen: false);
    return await showDialog<List?>(
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, stater) {
            return SingleChildScrollView(
              child: AlertDialog(
                //  actionsAlignment: MainAxisAlignment.center,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Style.mov, width: 4),
                ),
                title: CustomText(
                  title: 'Are you sure delete Note??',
                  color: Style.mov,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                content: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Style.mov,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: CustomText(
                            title: 'yes',
                          ),
                          onPressed: () {
                            scheduleProvider.removeSchedule(indexId);
                            // print(
                            //     ' notee.id = ${.id} from dialog');
                            print('indexId = $indexId');
                            Navigator.of(context).pop();

                            // setState(() {
                            //   scheduleProvider.removeSchedule(indexId);
                            //   print(
                            //       ' notee.id = ${widget.schedule.id} from dialog');
                            //   print('indexId = $indexId');
                            //   Navigator.of(context).pop();
                            // });
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Style.mov,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: CustomText(
                            title: "No",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<ScheduleProvider>(context);

    String _startDateformatt = DateFormat.yMMMEd().format(_startDate);
    String _endDateformatt = DateFormat.yMMMEd().format(_endDate);

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
              widget.schedulee != null
                  ? schedule.updateSchedule(Schedule(
                      id: widget.schedulee!.id,
                      title: scheduleTitleController.text,
                      startDate: _startDateformatt,
                      endDate: _endDateformatt,
                      note: noteController.text,
                      place: locationController.text,
                      isChecked: false,
                      isFullDay: false,
                      repeat: _selectedDays.toString(),
                      reminder: 'Reminder',
                    ))
                  : schedule.addSchedule(
                      Schedule(
                        title: scheduleTitleController.text,
                        isFullDay: isSwitch,
                        startDate: _startDateformatt,
                        endDate: _endDateformatt,
                        place: locationController.text,
                        note: noteController.text,
                        isChecked: false,
                        reminder: "Reminder",
                        repeat: _selectedDays.toString(),
                      ),
                    );
              Navigator.of(context).pop();
              print('$schedule icon add ');
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
                cursorColor: Colors.white,
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
                onDateTimeSelected: (startDate) {
                  // String startdateformat =
                  //     DateFormat.yMMMEd().format(startDate);

                  setState(() {
                    _startDate = startDate;
                  });
                },
              ),
              CustomListTileDateTimePicker(
                title: 'Finish',
                onDateTimeSelected: (endDate) {
                  setState(() {
                    _endDate = endDate;
                  });
                },
              ),
              CustomListTile(
                onSubmit: (selectedDays) {
                  setState(() {
                    _selectedDays = selectedDays;
                  });
                },
                title: 'Repeat',
              ),
              ListTile(
                title: CustomText(
                  title: 'Reminder',
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomTextField(
                  txtEditingController: locationController,
                  hintTxt: 'Location',
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.white,
                ),
              ),
              CustomTextField(
                txtEditingController: noteController,
                hintTxt: 'Note',
                keyboardType: TextInputType.text,
                cursorColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
