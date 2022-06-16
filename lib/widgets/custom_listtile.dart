// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_button.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CustomListTile extends StatefulWidget {
  CustomListTile({
    Key? key,
    required this.title,
    // required this.trailTitle,
  }) : super(key: key);
  final String title;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  List<String> week = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuseday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  @override
  Widget build(BuildContext context) {
    bool _checked = false;
    Future showdialog1(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: CustomText(
                title: 'Repeat',
                size: 20,
                fontWeight: FontWeight.bold,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < week.length; i++)
                    CheckboxListTile(
                        title: CustomText(
                          title: week[i],
                        ),
                        value: _checked,
                        onChanged: (bool? value) {
                          setState(() {
                            _checked = value!;
                          });
                        }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CustomButton(title: 'Submit',),
                      CustomButton(title: 'Cancel',),

                    ],
                  )
                ],
              ),
            );
          });
    }

    return ListTile(
      title: CustomText(
        title: widget.title,
        color: Colors.white,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title: 'jjjj',
            color: Style.grey,
            size: 13,
          ),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.white,
              ),
              onPressed: () => showdialog1(context)),
        ],
      ),
    );
  }
}
