import 'package:todoapp/models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/sqflite_tuturial/home_sqflite.dart';

class NoteDatabaseHelper {
  NoteDatabaseHelper._privateConstructor();
  static final NoteDatabaseHelper instance =
      NoteDatabaseHelper._privateConstructor();

  Future<List<Note>> getNotes() async {
    Database db = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>> notes =
        await db.query(notTable, orderBy: 'id');
    List<Note> notesList =
        notes.isNotEmpty ? notes.map((e) => Note.fromJson(e)).toList() : [];
    return notesList;
  }

  Future<int> addNote(Note note) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert(notTable, note.toJson());
  }

  Future<int> updateNote(Note note) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.update(
      notTable,
      note.toJson(),
      where: 'id=?',
      whereArgs: [note.id],
    );
  }

  Future<int> removeNote(Note note) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(
      notTable,
      where: 'id=?',
      whereArgs: [note.id],
    );
  }
}
