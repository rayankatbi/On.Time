// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/screens/note_tab.dart';
import 'package:todoapp/screens/schedule_tab.dart';
import 'package:todoapp/widgets/custom_appbar.dart';
import 'package:todoapp/widgets/custom_text.dart';
import 'package:todoapp/widgets/floating_actionButton_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1F1338),
              Color(0xff3A3372),
              Color(0xff3C1F7B),
              Color(0xff241641),
            ]),
      ),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            height: 70,
          ),
          body: Column(
            children: [
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.23, vertical: 20),
                decoration: BoxDecoration(
                  color: Style.mov,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Style.darkMov,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  tabs: [
                    CustomText(title: 'Schedule'),
                    CustomText(
                      title: 'Note',
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ScheduleTab(),
                    NoteTab(),
                  ],
                ),
              )
            ],
          ),
          floatingActionButton: FloatingAButton(),
        ),
      ),
    );
  }
}
