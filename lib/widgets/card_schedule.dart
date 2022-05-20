import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CardSchedule extends StatefulWidget {
  CardSchedule({Key? key}) : super(key: key);

  @override
  State<CardSchedule> createState() => _CardScheduleState();
}

class _CardScheduleState extends State<CardSchedule> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Style.cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical:5 ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: 'Dinner with Anna',
                  color: Colors.white,
                ),
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
                  title: 'date/time',
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
                SizedBox(
                  width: 10,
                ),
                CustomText(
                  title: 'date/time',
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
                  title: 'date/time',
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
