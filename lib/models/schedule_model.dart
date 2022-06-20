const String scheduleTable = "Schedule";

class Schedule {
  final int? id;
  final String title;
  final bool isFullDay;
  final String startDate;
  final String endDate;
  final String place;
  final String note;
    bool isChecked ;
  final String reminder;
  final String repeat;

  Schedule(
      {this.id,
      required this.title,
      required this.isFullDay ,
      required this.startDate,
      required this.endDate,
      required this.place,
      required this.note,
     required  this.isChecked ,
      required this.reminder,
      required this.repeat});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json['id'],
        title: json['title'],
        isFullDay: json['isFullDay'] == 1,
        startDate: json['startDate'],
        endDate: json['endDate'],
        place: json['place'],
        note: json['note'],
        isChecked: json['isChecked'] == 1,
        reminder: json['reminder'],
        repeat: json['repeat'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isFullDay': isFullDay == true? 1 : 0,
        'startDate': startDate,
        'endDate': endDate,
        'place': place,
        'note': note,
        'isChecked': isChecked == true? 1 : 0,
        'reminder': reminder,
        'repeat': repeat,
      };
}
