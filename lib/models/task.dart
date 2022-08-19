class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? data;
  String? startTime;
  String? endTime;
  int? color;

  String? repeat;
  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.data,
    this.startTime,
    this.endTime,
    this.color,

    this.repeat,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'date': data,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'repeat': repeat,
    };
  }

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    data = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];

    repeat = json['repeat'];
  }
}