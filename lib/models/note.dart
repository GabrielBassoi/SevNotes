class Note {
  Note(this.title, this.body, this.isFavorite, this.creationDate);

  String title;
  String body;
  bool isFavorite;
  String creationDate;

  Note.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        body = json["body"],
        isFavorite = json["isFavorite"],
        creationDate = json["creationDate"];

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "isFavorite": isFavorite,
        "creationDate": creationDate
      };
}
