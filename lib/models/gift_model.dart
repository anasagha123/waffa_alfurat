class Gift {
  String? title;
  String? image;
  int? points;

  Gift({this.image, this.title, this.points});

  Gift.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    image = json["image"];
    points = json["points"];
  }
}
