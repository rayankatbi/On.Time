import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/models/schedule_model.dart';
import 'package:todoapp/providers/schedule_provider.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CardSchedule extends StatefulWidget {
  CardSchedule({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  Schedule schedule;

  @override
  State<CardSchedule> createState() => _CardScheduleState();
}

class _CardScheduleState extends State<CardSchedule> {
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
                  title: 'you did task \n Let\'s remove it',
                  color: Style.mov,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
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
                            title: 'yes I did',
                          ),
                          onPressed: () {
                            setState(() {
                              scheduleProvider.removeSchedule(indexId);
                              print(
                                  ' notee.id = ${widget.schedule.id} from dialog');
                              print('indexId = $indexId');
                              Navigator.of(context).pop();
                            });
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
                            title: "No I did\'nt",
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
    final scheduleProvider = Provider.of<ScheduleProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Style.cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: widget.schedule.title,
                  color: Colors.white,
                ),
                Checkbox(
                    side: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    activeColor: Style.lightMov,
                    value: widget.schedule.isChecked,
                    onChanged: (value) {
                      setState(() {
                        widget.schedule.isChecked = value!;
                      });

                      if (widget.schedule.isChecked == true) {
                        int idIndex = widget.schedule.id!;
                        showdialog1(context, idIndex);
                        print('remove from card');
                        print(' notee.id = ${widget.schedule.id}');
                        //scheduleProvider.removeSchedule(widget.schedule.id!);
                      }
                    }),
              ],
            ),
            Divider(color: Style.lightMov),
            Row(
              children: [
                CustomText(
                  title: 'Time',
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  title: widget.schedule.startDate,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CustomText(
                  title: 'Place',
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                CustomText(
                  title: widget.schedule.place,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CustomText(
                  title: 'Notes',
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  title: widget.schedule.note,
                  color: Colors.white,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
