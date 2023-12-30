import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/models/invoice_model.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

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
        response = await DioHelper.postData(
            path: EndPoints.viewInvoicesForCustomer,
            data: {"customer": UserController.customer.id});
      case UserType.agent:
        response = await DioHelper.postData(
            path: EndPoints.viewInvoicesForAgents,
            data: {"agent": UserController.agent.id});
      default:
        throw "error invoice user type error";
    }
    for (int i = 0; i < response.data.length; i++) {
      invoice.add(Invoice.fromJson(json: response.data[i]));
    }
    invoice = invoice.reversed.toList();
    islodaing = false;
    update();
  }
}
