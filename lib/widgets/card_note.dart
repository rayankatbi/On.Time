// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_text.dart';

class CardNote extends StatelessWidget {
  const CardNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
            title:
                'this morning\'s meeting, we have to improve the quality of office facilities and another...',
            //     'need for this month:\n'
            //     '-clothes\n'
            //     '-snack...\n'
            // 'ddddd\n',
            color: Style.white,
            maxLines: 4,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title: '12/11/2025',
                color: Style.white,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.push_pin,
                  color: Style.white,
                  size: 15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
