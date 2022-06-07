// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CardNote extends StatelessWidget {
  CardNote({
    Key? key,
    required this.title,
    required this.date,
    required this.content,
  }) : super(key: key);

  final String title;
  final String date;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Style.cardColor,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          CustomText(
            title: title,
            color: Style.white,
            maxLines: 1,
            size: 18,
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            title: content,
            color: Style.white,
            maxLines: 4,
          ),
          SizedBox(
            height: 5,
          ),
          CustomText(
            title: date,
            color: Style.white,
          )
        ],
      ),
    );
  }
}
