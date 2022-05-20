// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_listtile.dart';
import 'package:todoapp/widgets/custom_text.dart';
import 'package:todoapp/widgets/custom_textfield.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.mov,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: CustomText(
          title: 'Notification',
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return CustomListTile(
              title: 'Dinner with anna',
              trailTitle: 'date/time',
            );
          }),
    );
  }
}
