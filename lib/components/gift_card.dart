import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffaa_alfurat/components/snack_bar.dart';
import 'package:waffaa_alfurat/controllers/points_controller.dart';
import 'package:waffaa_alfurat/controllers/user_controller.dart';
import 'package:waffaa_alfurat/models/gift_model.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';

class GiftCard extends StatelessWidget {
  final Gift gift;
  final int index;

  const GiftCard({super.key, required this.gift, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(-10, 20),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.16,
            width: Get.width * 0.45,
            child: Image.network(
              "https://wafaaalfurat.store/storage/${gift.image}",
              fit: BoxFit.cover,
            ),
          ),
          Divider(height: Get.height * 0.008),
          Text(
            "${gift.title}",
            style: Get.textTheme.bodySmall,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Get.height * 0.01),
          Text(
            "${gift.points} نقطة",
            style: Get.textTheme.bodySmall,
          ),
          SizedBox(height: Get.height * 0.01),
          Visibility(
            visible: UserController.userType == UserType.customer,
            replacement: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFCCCCCC)),
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Color(0xFF999999)))),
              onPressed: () {},
              child: Text(
                "طلب",
                style: Get.textTheme.bodyMedium!
                    .copyWith(color: const Color(0xFF666666)),
              ),
            ),
            child: GetBuilder<GiftCardController>(
              init: GiftCardController(),
              builder: (controller) => Visibility(
                visible:
                    !controller.isloading && controller.selectedIndex == -1,
                replacement: Visibility(
                  visible: controller.selectedIndex != index,
                  replacement: const CircularProgressIndicator(),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFFCCCCCC)),
                        side: MaterialStatePropertyAll(
                            BorderSide(color: Color(0xFF999999)))),
                    onPressed: () {},
                    child: Text(
                      "طلب",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: const Color(0xFF666666)),
                    ),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    controller.requestGift(gift.id!, index);
                  },
                  child: const Text("طلب"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GiftCardController extends GetxController {
  bool isloading = false;
  int selectedIndex = -1;

  requestGift(int giftId, int index) async {
    selectedIndex = index;
    isloading = true;
    update();

    Response response = await HttpClient.postData(
      path: EndPoints.requestGift,
      body: {
        "customer_id": UserController.customer.id,
        "gift_id": giftId,
      },
    );

    if (response.body["message"] == "تم تسجيل طلب الهدية بنجاح") {
      showSnackBar(
        message: response.body["message"],
        state: SnackBarState.success,
      );
      PointsController pointsController = Get.find();

      pointsController.getPoints();
    } else {
      showSnackBar(
        message: response.body["message"],
        state: SnackBarState.warning,
      );
    }

    isloading = false;
    selectedIndex = -1;
    update();
  }
}
