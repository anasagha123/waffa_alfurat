class Product {
  late String? image;
  late String? title;
  late String? price;

  Product({this.image, this.title, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    title = json["title"];
    price = json["price"].toString().replaceAll(RegExp(r'\.0$'), "");
  }
}
