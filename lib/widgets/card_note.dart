// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/models/note_model.dart';
import 'package:todoapp/providers/note_provider.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CardNote extends StatelessWidget {
  CardNote({
    Key? key,
    required this.notee,
  }) : super(key: key);
  Future showdialog1(BuildContext context, int indexId) async {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);
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
                  title: 'Are you sure delete this note??',
                  color: Style.mov,
                  size: 20,
                  maxLines: 4,
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
                            noteProvider.removeNote(indexId);
                            Navigator.of(context).pop();
                            print('note rremove from dialog');
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

  Note notee;
  @override
  Widget build(BuildContext context) {
    final note = Provider.of<NoteProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Style.cardColor,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                title: 'Title:',
                color: Colors.white,
                size: 17,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomText(
                  title: notee.title,
                  color: Colors.white,
                  maxLines: 1,
                  size: 17,
                ),
              ),

              /*
              IconButton(
                onPressed: () {
                  print(' notee.id = ${notee.id}');
                  note.removeNote(notee.id!);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
               */
            ],
          ),
          Divider(
            color: Style.lightMov,
            thickness: 1,
          ),
          Row(
            children: [
              CustomText(
                title: 'Detail:',
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomText(
                  title: notee.content,
                  color: Colors.white,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                title: 'Created Time:',
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                title: notee.createdTime,
                color: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  print(' notee.id = ${notee.id}');
                  showdialog1(context, notee.id!);
                  // note.removeNote(notee.id!);
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(5),
                  child: CustomText(
                    title: 'Delete',
                    color: Style.red,
                    size: 13,
                  ),
                  decoration: BoxDecoration(
                    color: Style.lightMov,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
