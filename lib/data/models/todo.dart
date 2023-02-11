class Todo{
  int id;
  String title;
  String description;
  String priority;
  String deadline_at;


  Todo({required this.id,required this.title,required this.description,required this.priority,required this.deadline_at});

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "title": this.title,
      "description": this.description,
      "priority": this.priority,
      "datetime": this.deadline_at,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      priority: json["priority"],
      deadline_at: json["deadline_at"],
    );
  }
//

}