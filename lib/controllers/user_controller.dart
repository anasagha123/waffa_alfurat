import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waffat_alfurat/models/agent_model.dart';
import 'package:waffat_alfurat/models/customer_model.dart';

enum UserType { none, agent, customer, visitor }

class UserController extends GetxController {
  static UserType userType = UserType.none;

  static Agent agent = Agent();
  static Customer customer = Customer();

  static late SharedPreferences sharedPreferences;

  static initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveUser({required Map<String, dynamic> json}) {
    switch (userType) {
      case UserType.customer:
        {
          customer = Customer.fromJson(json: json["customer"]);
          setCustomer();
        }
      case UserType.agent:
        {
          agent = Agent.fromJson(json: json["agent"]);
          setAgent();
        }
      default:
        break;
    }
  }

  static void setAgent() {
    sharedPreferences.setInt("id", agent.id!);
    sharedPreferences.setString("name", agent.name ?? "");
    sharedPreferences.setString("phone", agent.phone ?? "");
    sharedPreferences.setString("address", agent.address ?? "");
    sharedPreferences.setInt("points", agent.points!);
  }

  static void setCustomer() {
    sharedPreferences.setInt("id", customer.id!);
    sharedPreferences.setString("name", customer.name ?? "");
    sharedPreferences.setString("phone", customer.phone ?? "");
    sharedPreferences.setString("address", agent.address ?? "");
    sharedPreferences.setInt("points", customer.points!);
  }

  static void getUserType() {
    String val = sharedPreferences.getString("userType")!;
    switch (val) {
      case "agent":
        userType = UserType.agent;
      case "customer":
        userType = UserType.customer;
      case "visitor":
        userType = UserType.visitor;
      case "none":
        userType = UserType.none;
      default:
        throw "error undefined user type of $val";
    }
  }

  static void setUserType(String val) {
    sharedPreferences.setString("userType", val);
  }

  static void getUser() {
    getUserType();
    switch (userType) {
      case UserType.customer:
        getCustomer();
      case UserType.agent:
        getAgent();
      default:
        break;
    }
  }

  static void getAgent() {
    agent.id = sharedPreferences.getInt("id");
    agent.name = sharedPreferences.getString("name");
    agent.phone = sharedPreferences.getString("phone");
    agent.address = sharedPreferences.getString("address");
    agent.points = sharedPreferences.getInt("points");
  }

  static void getCustomer() {
    customer.id = sharedPreferences.getInt("id");
    customer.name = sharedPreferences.getString("name");
    customer.phone = sharedPreferences.getString("phone");
    customer.address = sharedPreferences.getString("address");
    customer.points = sharedPreferences.getInt("points");
  }

  static void removeAgent() {
    sharedPreferences.remove("id");
    sharedPreferences.remove("name");
    sharedPreferences.remove("phone");
    sharedPreferences.remove("address");
    sharedPreferences.remove("points");
  }

  static void removeCustomer() {
    sharedPreferences.remove("id");
    sharedPreferences.remove("name");
    sharedPreferences.remove("phone");
    sharedPreferences.remove("address");
    sharedPreferences.remove("points");
  }

  static void removeUser() {
    sharedPreferences.remove("userType");
    switch (userType) {
      case UserType.agent:
        removeAgent();
      case UserType.customer:
        removeCustomer();
      default:
        break;
    }
  }

  static void logOut() {
    UserController.removeUser();

    Get.offAllNamed("userType");
  }
}
