class Post {
  int? id;
  String? title;
  String? description;
  String? date;

  Post.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["desc"];
    date = json["created_at"];
  }
}
