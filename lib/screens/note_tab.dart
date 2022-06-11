// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/models/note_model.dart';
import 'package:todoapp/providers/note_provider.dart';
import 'package:todoapp/screens/note_detail.dart';
import 'package:todoapp/widgets/card_note.dart';
import 'package:todoapp/widgets/custom_text.dart';
import 'package:todoapp/widgets/custom_textfield.dart';

class NoteTab extends StatelessWidget {
  NoteTab({Key? key}) : super(key: key);

  int? selectedId;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final TextEditingController searchController = TextEditingController();
    final note = Provider.of<NoteProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.09, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              txtEditingController: searchController,
              hintTxt: 'Search Note',
              prefixIcon: Icons.search,
              keyboardType: TextInputType.text,
            ),
            // note.items.isEmpty
            //     ? Container(
            //         margin: EdgeInsets.symmetric(vertical: 10),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           color: Style.cardColor,
            //         ),
            //         padding: EdgeInsets.all(10),
            //         child: CustomText(title: 'You didn\'t have any Note ,'),
            //       )
            //     :
            ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: note.lengthItems(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteDetail(
                            selectedId: "${note.items[index].id}",
                            title: note.items[index].title,
                            // date: note.items[index].createdTime,
                            content: note.items[index].content,
                          ),
                        ),
                        //note.items[index].id,),
                      );
                    },
                    child: CardNote(
                      title: note.items[index].title,
                      date: note.items[index].createdTime,
                      content: note.items[index].content,
                      idtodelet:note.items[index].id ,

                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
