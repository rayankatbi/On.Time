const String notTable = "Note";

class Note {
  final int? id;
  final String title;
  final String content;
  final String createdTime;

  Note({
     this.id,
    required this.title,
    required this.content,
    required this.createdTime,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdTime: json["createdTime"],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "createdTime": createdTime,
    };
  }
}
