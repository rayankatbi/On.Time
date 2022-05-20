// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_text.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwiched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Style.mov,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
            title: 'Setting',
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: 'Notification',
                size: 22,
                fontWeight: FontWeight.w500,
                color: Style.white,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Style.grey,
                thickness: 1,
              ),
              CustomText(
                title: 'Audio',
                size: 18,
                color: Style.white,

              ),
              ListTile(
                title: CustomText(
                  title: 'Notification Bar',
                  size: 18,
                  color: Style.white,

                ),
                trailing: Switch(
                  activeColor: Style.lightMov,
                  value: isSwiched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwiched = value;
                    });
                  },
                ),
              ),
              CustomText(
                title: 'Extras',
                size: 22,
                color: Style.white,

                fontWeight: FontWeight.w500,
              ),
              Divider(
                color: Style.grey,
                thickness: 1,
              ),
              CustomText(
                title: 'Help',
                size: 18,
                color: Style.white,

              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                title: 'About',
                size: 18,
                color: Style.white,

              ),
            ],
          ),
        ));
  }
}
