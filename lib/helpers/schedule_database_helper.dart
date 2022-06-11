import 'package:sqflite/sqflite.dart';
import 'package:todoapp/helpers/database_helper.dart';
import 'package:todoapp/models/schedule_model.dart';


class ScheduleDatabaseHelper {

  static final ScheduleDatabaseHelper instance = ScheduleDatabaseHelper._init();
  ScheduleDatabaseHelper._init();

  // ScheduleDatabaseHelper._privateConstructor();
  //  final ScheduleDatabaseHelper instance =
  //     ScheduleDatabaseHelper._privateConstructor();

  Future<List<Schedule>> getSchedule() async {
    Database db = await DataBaseHelper.instance.database;
    final List<Map<String, Object?>> schedules =
        await db.query(scheduleTable, orderBy: 'id');
    List<Schedule> scheduleList = schedules.isNotEmpty
        ? schedules.map((e) => Schedule.fromJson(e)).toList()
        : [];
    return scheduleList;
  }

  Future<int> addSchedule(Schedule schedule) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.insert(scheduleTable, schedule.toJson());
  }

  Future<int> updateSchedule(Schedule schedule) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.update(
      scheduleTable,
      schedule.toJson(),
      where: 'id=?',
      whereArgs: [schedule.id],
    );
  }

  Future<int> removeSchedule(Schedule schedule) async {
    Database db = await DataBaseHelper.instance.database;
    return await db.delete(
      scheduleTable,
      where: 'id=?',
      whereArgs: [schedule.id],
    );
  }
}
