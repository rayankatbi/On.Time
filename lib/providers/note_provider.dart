import 'package:flutter/material.dart';
import 'package:todoapp/helpers/note_database_helper.dart';
import 'package:todoapp/models/note_model.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _items = [];
  List<Note> get items => [..._items];

  Future getNotes() async {
    _items = await NoteDatabaseHelper.instance.getNotes();
    notifyListeners();
  }

  Future addNotes(Note note) async {
    _items.insert(0, await  NoteDatabaseHelper.instance.addNote(note));
    notifyListeners();
  }

  Future updateNote(Note note) async {
    final index = _items.indexWhere((e) => e.id == note.id);
    _items[index] == note;
    notifyListeners();
    await NoteDatabaseHelper.instance.updateNote(note);
  }

  Future removeNote(int id) async {
    _items.removeWhere((e) => e.id == id);
    notifyListeners();
    await NoteDatabaseHelper.instance.removeNote(id);
  }

  int lengthItems() {
    return _items.length;
  }
}
