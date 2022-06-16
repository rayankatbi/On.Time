// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/constant.dart';
import 'package:todoapp/models/note_model.dart';
import 'package:todoapp/providers/note_provider.dart';

class NoteDetail extends StatefulWidget {
  NoteDetail({
    Key? key,
    this.notee,
  }) : super(key: key);

  Note? notee;
  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  late final TextEditingController detailNoteController =
      TextEditingController(text: widget.notee?.content);

  late final TextEditingController titleNoteController =
      TextEditingController(text: widget.notee?.title);

//  @override
  // void dispose() {
  //   detailNoteController.text = '';
  //   titleNoteController.text = '';
  // }
  @override
  Widget build(BuildContext context) {
    final note = Provider.of<NoteProvider>(context);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(now);

    return Scaffold(
      backgroundColor: Style.cardColor,
      appBar: AppBar(
        backgroundColor: Style.cardColor,
        elevation: 0,
        actions: [
          // IconButton(
          //   onPressed: () {
          //     note.updateNote(
          //       Note(
          //         id: widget.selectId,
          //         title: titleNoteController.text,
          //         content: detailNoteController.text,
          //         createdTime: formattedDate,
          //       ),
          //     );
          //     Navigator.pop(context);
          //   },
          //   icon: Icon(
          //     Icons.edit,
          //     color: Colors.white,
          //   ),
          // ),
          IconButton(
            onPressed: () {
              widget.notee != null
                  ? note.updateNote(
                      Note(
                        id: widget.notee!.id,
                        title: titleNoteController.text,
                        content: detailNoteController.text,
                        createdTime: formattedDate,
                      ),
                    )
                  : note.addNotes(
                      Note(
                        title: titleNoteController.text,
                        content: detailNoteController.text,
                        createdTime: formattedDate,
                      ),
                    );
              Navigator.pop(context);
            },
            icon: Icon(Icons.check, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: titleNoteController,
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
              controller: detailNoteController,
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
      ),
    );
  }
}
