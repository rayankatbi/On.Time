import 'package:flutter/material.dart';
import 'package:todoapp/helpers/schedule_database_helper.dart';
import 'package:todoapp/models/schedule_model.dart';

class ScheduleProvider with ChangeNotifier {
  List<Schedule> _items = [];
  List<Schedule> get items => [..._items];

  Future getSchedule() async {
    _items = await ScheduleDatabaseHelper.instance.getSchedule();
    notifyListeners();
  }

  Future addSchedule(Schedule schedule) async {
    _items.insert(0, schedule);
    notifyListeners();
    await ScheduleDatabaseHelper.instance.addSchedule(schedule);
  }

  Future updateSchedule(Schedule schedule) async {
    final index = _items.indexWhere((e) => e.id == schedule.id);
    _items[index] = schedule;
    notifyListeners();
    await ScheduleDatabaseHelper.instance.updateSchedule(schedule);
  }

  Future removeSchedule(Schedule schedule) async {
    _items.removeWhere((e) => e.id == schedule.id);
    notifyListeners();
    await ScheduleDatabaseHelper.instance.removeSchedule(schedule);
  }
}
