const String scheduleTable = "Schedule";

class Schedule {
  final int id;
  final String title;
  final bool isFullDay;
  final String  startDate;
  final String endDate;
  final String place;
  final String note;
  final bool isChecked;
  final String reminder;
  final String repeat;

  Schedule(
      {required this.id,
      required this.title,
      required this.isFullDay,
      required this.startDate,
      required this.endDate,
      required this.place,
      required this.note,
      required this.isChecked,
      required this.reminder,
      required this.repeat});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json['id'],
        title: json['title'],
        isFullDay: json['isFullDay'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        place: json['place'],
        note: json['note'],
        isChecked: json['isChecked'],
        reminder: json['reminder'],
        repeat: json['repeat'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isFullDay': isFullDay,
        'startDate': startDate,
        'endDate': endDate,
        'place': place,
        'note': note,
        'isChecked': isChecked,
        'reminder': reminder,
        'repeat': repeat,
      };
}
