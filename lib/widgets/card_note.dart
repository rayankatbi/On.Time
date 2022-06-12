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
    // required this.title,
    // required this.date,
    // required this.content,
    // required this.idtodelet,
    required this.notee,
    // required this.onPressed,
  }) : super(key: key);

  Note notee;
  // final String title;
  // final String date;
  // final String content;
  // final int idtodelet;
  // final Function onPressed;
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
          CustomText(
            title: notee.title,
            color: Style.white,
            maxLines: 1,
            size: 18,
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            title: notee.content,
            color: Style.white,
            maxLines: 4,
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            title: notee.createdTime,
            color: Style.white,
          )
        ],
      ),
    );
  }
}
