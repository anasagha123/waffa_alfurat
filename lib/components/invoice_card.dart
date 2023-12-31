import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/models/invoice_model.dart';

class InvoiceCard extends StatelessWidget {
  final Invoice invoice;

  const InvoiceCard({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      height: Get.height * 0.20,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: Get.theme.colorScheme.primary,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Center(
                  child: Text(
                "رقم الفاتورة : ${invoice.number}",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.black),
              )),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: UserController.userType == UserType.agent,
                      replacement: Text(
                        "الوكيل",
                        style: Get.textTheme.bodyMedium!.copyWith(
                            color: Get.theme.colorScheme.onPrimary,
                            fontSize: Get.textTheme.bodyMedium!.fontSize! * 0.8,
                            fontWeight: FontWeight.bold),
                      ),
                      child: Text(
                        "الكهربائي",
                        style: Get.textTheme.bodyMedium!.copyWith(
                            color: Get.theme.colorScheme.onPrimary,
                            fontSize: Get.textTheme.bodyMedium!.fontSize! * 0.8,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    UserController.userType == UserType.agent
                        ? Text(
                            "${invoice.customer}",
                            style: Get.textTheme.bodyMedium!.copyWith(
                              color: Get.theme.colorScheme.onPrimary,
                              fontSize:
                                  Get.textTheme.bodyMedium!.fontSize! * 0.8,
                            ),
                          )
                        : Text(
                            "${invoice.agent}",
                            style: Get.textTheme.bodyMedium!.copyWith(
                              color: Get.theme.colorScheme.onPrimary,
                              fontSize:
                                  Get.textTheme.bodyMedium!.fontSize! * 0.8,
                            ),
                          ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "قيمة الفاتورة",
                      style: Get.textTheme.bodyMedium!.copyWith(
                          color: Get.theme.colorScheme.onPrimary,
                          fontSize: Get.textTheme.bodyMedium!.fontSize! * 0.8,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${invoice.price} د.ع",
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: Get.theme.colorScheme.onPrimary,
                        fontSize: Get.textTheme.bodyMedium!.fontSize! * 0.8,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "النقاط",
                      style: Get.textTheme.bodyMedium!.copyWith(
                          color: Get.theme.colorScheme.onPrimary,
                          fontSize: Get.textTheme.bodyMedium!.fontSize! * 0.8,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      invoice.points.toString(),
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: Get.theme.colorScheme.onPrimary,
                        fontSize: Get.textTheme.bodyMedium!.fontSize! * 0.8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
