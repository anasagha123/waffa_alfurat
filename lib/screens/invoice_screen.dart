import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/components/invoice_card.dart';
import 'package:waffat_alfurat/controllers/invoice_screen_controller.dart';
import 'package:waffat_alfurat/controllers/points_controller.dart';

class InvoiceScreen extends StatelessWidget {
  final InvoiceScreenController screenController =
      Get.put(InvoiceScreenController());
  InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: screenController.getInvoices,
            icon: Icon(
              Icons.refresh_rounded,
              color: Get.theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: GetBuilder<InvoiceScreenController>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.01, horizontal: Get.width * 0.05),
          child: Visibility(
            visible: !controller.islodaing,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Visibility(
              visible: controller.invoice.isNotEmpty,
              replacement: const Center(child: Text("لا يوجد فواتير")),
              child: Column(
                children: [
                  Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.1,
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.primary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GetBuilder<PointsController>(
                      init: PointsController(),
                      builder: (pcontorller) => Visibility(
                        visible: !pcontorller.isloading,
                        replacement:
                            const Center(child: CircularProgressIndicator()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "النقاط",
                              style: Get.textTheme.bodyLarge,
                            ),
                            const Text(":"),
                            Text(
                              "${pcontorller.points}",
                              style: Get.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  SizedBox(
                    height: Get.height * 0.7,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.invoice.length,
                      itemBuilder: (context, index) =>
                          InvoiceCard(invoice: controller.invoice[index]),
                      separatorBuilder: (context, index) => Divider(
                        height: Get.height * 0.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
