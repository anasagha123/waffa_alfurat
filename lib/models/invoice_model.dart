class Invoice {
  int? id;
  String? number;
  int? points;
  String? price;
  String? agent;
  String? customer;
  int? customerId;
  int? agentId;

  Invoice();

  Invoice.fromJson({required Map<String, dynamic> json}) {
    id = json["id"];
    number = json["number"];
    points = json["points"];
    price = json["price"].toString().replaceAll(RegExp(r'\.0$'), "");
    agent = json["agent"];
    customer = json["customer"];
    customerId = json["customer_id"];
    agentId = json["agent_id"];
  }
}
