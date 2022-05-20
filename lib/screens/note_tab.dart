// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/screens/note_detail.dart';
import 'package:todoapp/widgets/card_note.dart';
import 'package:todoapp/widgets/custom_textfield.dart';

import 'main_page.dart';

class NoteTab extends StatelessWidget {
  const NoteTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: width * 0.09, vertical: 20),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
            hintTxt: 'Search Note',
            prefixIcon: Icons.search,
            keyboardType: TextInputType.text,
           // heightPro: 90,
           // widthPro: width*0.8,
          ),
          ListView.builder(

              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> NoteDetail(),
                      ) );
                    },
                    child: CardNote(),);
              }),
        ],
      ),
  );
  }
}
