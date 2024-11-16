import 'package:get/get.dart';
import 'package:waffaa_alfurat/controllers/user_controller.dart';
import 'package:waffaa_alfurat/models/invoice_model.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

class InvoiceScreenController extends GetxController {
  bool islodaing = false;
  List<Invoice> invoice = [];

  InvoiceScreenController() {
    getInvoices();
  }

  Future getInvoices() async {
    islodaing = true;
    update();

    invoice = [];
    Response response;
    switch (UserController.userType) {
      case UserType.customer:
        response = await HttpClient.postData(
            path: EndPoints.viewInvoicesForCustomer,
            body: {"customer": UserController.customer.id});
      case UserType.agent:
        response = await HttpClient.postData(
            path: EndPoints.viewInvoicesForAgents,
            body: {"agent": UserController.agent.id});
      default:
        throw "error invoice user type error";
    }
    for (int i = 0; i < response.body.length; i++) {
      invoice.add(Invoice.fromJson(json: response.body[i]));
    }
    invoice = invoice.reversed.toList();
    islodaing = false;
    update();
  }
}
