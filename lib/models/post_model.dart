class Post {
  String? title;
  String? description;
  String? date;

  Post.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["desc"];
    date = json["created_at"];
  }
}
