class Agent {
  int? id;
  String? name;
  String? phone;
  String? address;
  int? points;

  Agent({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.points,
  });

  Agent.fromJson({required Map<String, dynamic> json}) {
    id = json["id"];
    name = json["name"];
    phone = json["phone"];
    address = json["address"];
    points = json["points"];
  }
}
