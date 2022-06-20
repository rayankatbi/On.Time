// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/screens/notification_screen.dart';
import 'package:todoapp/screens/setting_screen.dart';
import 'package:todoapp/widgets/custom_text.dart';
import 'package:badges/badges.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: CustomText(
        title: 'On.Time',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
