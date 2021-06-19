class Todo {
  String title;
  bool checked;

  Todo(this.title, this.checked);

  Todo.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        checked = json["checked"];

  Map<String, dynamic> toJson() => {
        "title": title,
        "checked": checked,
      };
}
