// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.trailTitle,
  }) : super(key: key);
  final String title;
  final String trailTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(
        title: title,
        color: Colors.white,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title: trailTitle,
            color: Style.grey,
            size: 13,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
