import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/models/note_model.dart';
import 'package:todoapp/models/schedule_model.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static const _dbName = 'onTime.db';
  static final idNote= 'id';
  static final titleNote = 'title';
  static final contentNote = 'content';
  static final createdTimeNote = 'createdTime';

  static final idSched = 'id';
  static final titleSched = 'title';
  static final isfulldaySched = 'isFullDay';
  static final startdateSched = 'startDate';
  static final enddateSched = 'endDate';
  static final placeSched = 'place';
  static final noteSched = 'note';
  static final isCheckSched = 'isChecked';
  static final reminderSched = 'reminder';
  static final repeatSched = 'repeat';


  static final DataBaseHelper instance = DataBaseHelper._init();
  DataBaseHelper._init();

//  DataBaseHelper._privateConstructor();

  //static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();
  // {
  //   if (_database != null) return _database;
  //   _database = await _initDatabase();
  //   return _database;
  // }

  Future<Database> _initDatabase() async {
   // Directory documentDirectory = await getApplicationDocumentsDirectory();
   // String path = join(documentDirectory.path, dbName);
    String path = join(await getDatabasesPath(),_dbName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    final idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final boolType = "BOOLEAN NOT NULL";
    final textType = "TEXT NOT NULL";
    final intType = "INTEGER NOT NULL";

    await db.execute('''
     CREATE TABLE $notTable (
     $idNote INTEGER PRIMARY KEY AUTOINCREMENT ,
     $titleNote TEXT NOT NULL,
     $contentNote TEXT NOT NULL,
     $createdTimeNote TEXT NOT NULL
    )
    ''');


    // id $idType,
    // title $textType,
    // content $textType,
    // createdTime $textType,
    await db.execute('''
   CREATE TABLE $scheduleTable (
     $idSched INTEGER PRIMARY KEY AUTOINCREMENT,
     $titleSched TEXT NOT NULL,
     $isfulldaySched $boolType,
     $startdateSched TEXT NOT NULL,
     $enddateSched TEXT NOT NULL,
     $placeSched TEXT NOT NULL,
     $noteSched TEXT NOT NULL,
     $isCheckSched $boolType,
     $reminderSched TEXT NOT NULL,
     $repeatSched TEXT NOT NULL
    )
    ''');

  }
}
