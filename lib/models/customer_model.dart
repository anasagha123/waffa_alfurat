class Customer {
  int? id;
  String? name;
  String? address;
  String? phone;
  int? points;

  Customer({
    this.id,
    this.name,
    this.phone,
    this.points,
  });

  Customer.fromJson({required Map<String, dynamic> json}) {
    id = json["id"];
    name = json["name"];
    address = json["address"];
    phone = json["phone"];
    points = json["points"];
  }
}
