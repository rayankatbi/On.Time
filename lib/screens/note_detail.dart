// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/widgets/custom_textfield.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Style.cardColor,
        appBar: AppBar(
          backgroundColor: Style.cardColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.push_pin),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: const TextStyle(
                      fontFamily: 'Open Sans',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    border: InputBorder.none),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Your Text',
                  hoverColor: Colors.red,
                  hintStyle: const TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ));
  }
}
