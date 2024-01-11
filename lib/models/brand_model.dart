class Brand {
  String? image;
  String? name;

  Brand.fromJson(Map<String, dynamic> json) {
    image = "https://wafaaalfurat.store/storage/${json["image"]}";
    name = json["name"];
  }
}
