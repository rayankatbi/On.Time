import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todoapp/models/note_model.dart';
import 'package:todoapp/models/schedule_model.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static const dbName = 'onTime.db';
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final boolType = "BOOLEAN NOT NULL";
    final textType = "TEXT NOT NULL";
    final intType = "INTEGER NOT NULL";
    await db.execute('''
    CREATE TABLE $scheduleTable (
     id $idType,
     title $textType,
     isFullDay $boolType,
     startDate $textType,
     endDate $textType,
     place $textType,
     note $textType,
     isChecked $boolType,
     repeat $textType,
     reminder $textType,
    )
    ''');
    await db.execute('''
    CREATE TABLE $notTable (
     id $idType,
     title $textType,
     content $textType,
     createdTime $textType,
     isPin  $intType,
     
    )
    ''');
  }
}
