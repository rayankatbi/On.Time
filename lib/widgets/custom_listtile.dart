// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/checkbox_state.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CustomListTile extends StatefulWidget {
  CustomListTile({
    Key? key,
    required this.onSubmit,
    required this.title,
  }) : super(key: key);
  final String title;
  final void Function(List selectedDays) onSubmit;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  final week = [
    CheckboxState(title: 'Saturday'),
    CheckboxState(title: 'Sunday'),
    CheckboxState(title: 'Monday'),
    CheckboxState(title: 'Tuseday'),
    CheckboxState(title: 'Wednesday'),
    CheckboxState(title: 'Thursday'),
    CheckboxState(title: 'Friday'),
  ];

  List _selectlist = [];

  Future<List?> showdialog1(BuildContext context) async {
    List selectlist = [];
    var selecteditem;
    return await showDialog<List?>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, stater) {
            Widget buildSignleCheckbox(CheckboxState checkbox) =>
                CheckboxListTile(
                    activeColor: Style.mov,
                    title: CustomText(title: checkbox.title),
                    value: checkbox.value,
                    onChanged: (value) {
                      selecteditem = checkbox.title;
                      stater(() {
                        checkbox.value = value!;
                        if (checkbox.value == true) {
                          selectlist.add(selecteditem);
                        } else {
                          selectlist.remove(selecteditem);
                        }
                        ;
                        print(selectlist);
                      });
                    });
            return SingleChildScrollView(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Style.mov, width: 4),
                ),
                title: CustomText(
                  title: 'Repeat',
                  color: Style.mov,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...week.map(buildSignleCheckbox).toList(),
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
                            title: 'Submit',
                          ),
                          onPressed: () {
                            print('selected item = ${selecteditem}');
                            print('selected list = ${selectlist}');
                            setState(() {
                              Navigator.of(context).pop(selectlist);
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
                            title: "Cancel",
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
    return ListTile(
      title: CustomText(
        title: widget.title,
        color: Colors.white,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title: "${_selectlist.length} days",
            color: Style.grey,
            size: 13,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.white,
            ),
            onPressed: () async {
              final List? selectedDaysFromDialog = await showdialog1(context);
              if (selectedDaysFromDialog != null) {
                setState(() {
                  _selectlist = selectedDaysFromDialog;
                });
                widget.onSubmit(selectedDaysFromDialog);
              }
            },
          ),
        ],
      ),
    );
  }
}
