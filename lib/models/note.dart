class Note {
  String id;
  String title;
  String body;
  bool isFavorite;
  String creationDate;

  Note({this.title, this.body, this.isFavorite, this.creationDate, this.id});

  Note.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        body = json["body"],
        isFavorite = json["isFavorite"],
        creationDate = json["creationDate"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "isFavorite": isFavorite,
        "creationDate": creationDate
      };
}
