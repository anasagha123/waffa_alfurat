import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:waffat_alfurat/models/agent_model.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

class AgentsController extends GetxController {
  bool isloading = false;
  List<Agent> agents = [];

  AgentsController();

  Future getAgents() async {
    isloading = true;
    update();

    Response response = await DioHelper.getData(path: EndPoints.viewAgents);
    for (int i = 0; i < response.data.length; i++) {
      agents.add(Agent.fromJson(response.data[i]));
    }

    isloading = false;
    update();
  }
}
