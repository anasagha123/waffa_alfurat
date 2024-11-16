import 'package:get/get.dart';
import 'package:waffaa_alfurat/models/agent_model.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

class AgentsScreenController extends GetxController {
  List<Agent> agents = [];
  bool isloading = false;

  AgentsScreenController() {
    getAgents();
  }

  getAgents() async {
    isloading = true;
    update();

    agents = [];
    Response response = await HttpClient.getData(path: EndPoints.viewAgents);
    for (int i = 0; i < response.body.length; i++) {
      agents.add(Agent.fromJson(response.body[i]));
    }

    isloading = false;
    update();
  }
}
