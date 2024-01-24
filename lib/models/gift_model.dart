class Gift {
  int? id;
  String? title;
  String? image;
  int? points;

  Gift({this.image, this.title, this.points});

  Gift.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = json["image"];
    points = json["points"];
  }
}
