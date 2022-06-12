import 'package:todoapp/helpers/database_helper.dart';
import 'package:todoapp/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NoteDatabaseHelper {
  static final NoteDatabaseHelper instance = NoteDatabaseHelper._init();
  NoteDatabaseHelper._init();

  Future<List<Note>> getNotes() async {
    Database db = await DataBaseHelper.instance.database;
    final List<Map<String, Object?>> notes =
        await db.query(notTable, orderBy: 'id');
    List<Note> notesList =
        notes.isNotEmpty ? notes.map((e) => Note.fromJson(e)).toList() : [];
    return notesList;
  }

  Future<Note> addNote(Note note) async {
    Database db = await DataBaseHelper.instance.database;
    await db.insert(notTable, note.toJson());

    final justAddedNote = Note.fromJson(
      (await db.query(
        notTable,
        orderBy: 'id DESC',
        limit: 1,
      ))
          .first,
    );

    return justAddedNote;
  }

  Future<int> updateNote(Note note) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.update(
      notTable,
      note.toJson(),
      where: 'id=?',
      whereArgs: [note.id],
    );
  }

  Future<int> removeNote(int id) async {
    Database db = await DataBaseHelper.instance.database;
    print(id);

    return await db.delete(
      notTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
