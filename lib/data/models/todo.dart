class Todo {
  String id;
  String title;
  String description;
  String priority;
  String deadline_at;
  String? begined_at;
  String? finished_at;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.priority,
      required this.deadline_at,
      required this.finished_at,
      required this.begined_at});

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "title": this.title,
      "description": this.description,
      "priority": this.priority,
      "deadline_at": this.deadline_at,
      "begined_at": this.begined_at,
      "finished_at": this.finished_at,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"].toString(),
      title: json["title"],
      description: json["description"],
      priority: json["priority"],
      deadline_at: json["deadline_at"],
      begined_at: json["begined_at"],
      finished_at: json["finished_at"],
    );
  }
//

}
