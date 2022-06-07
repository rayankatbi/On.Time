import 'package:sqflite/sqflite.dart';
import 'package:todoapp/models/schedule_model.dart';
import 'package:todoapp/sqflite_tuturial/home_sqflite.dart';

class ScheduleDatabaseHelper {
  ScheduleDatabaseHelper._privateConstructor();
  static final ScheduleDatabaseHelper instance =
      ScheduleDatabaseHelper._privateConstructor();

  Future<List<Schedule>> getSchedule() async {
    Database db = await DatabaseHelper.instance.database;
    final List<Map<String, Object?>> schedules =
        await db.query(scheduleTable, orderBy: 'id');
    List<Schedule> scheduleList = schedules.isNotEmpty
        ? schedules.map((e) => Schedule.fromJson(e)).toList()
        : [];
    return scheduleList;
  }

  Future<int> addSchedule(Schedule schedule) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert(scheduleTable, schedule.toJson());
  }

  Future<int> updateSchedule(Schedule schedule) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.update(
      scheduleTable,
      schedule.toJson(),
      where: 'id=?',
      whereArgs: [schedule.id],
    );
  }

  Future<int> removeSchedule(Schedule schedule) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(
      scheduleTable,
      where: 'id=?',
      whereArgs: [schedule.id],
    );
  }
}
