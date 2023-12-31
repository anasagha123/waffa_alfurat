import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Get.theme.colorScheme.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Get.height * 0.04,
          horizontal: Get.width * 0.05,
        ),
        child: Column(
          children: [
            MyListTile(
              title: "الصفحة الرئيسية",
              iconData: Icons.home_outlined,
              onTap: () {
                Get.offAllNamed("home");
              },
            ),
            SizedBox(height: Get.height * 0.02),
            UserController.userType != UserType.visitor
                ? Column(
                    children: [
                      MyListTile(
                        title: "الحساب الشخصي",
                        iconData: Icons.person_outline,
                        onTap: () {
                          Get.offAllNamed("profile");
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                    ],
                  )
                : const SizedBox(),
            MyListTile(
              title: "المنتجات",
              iconData: FontAwesomeIcons.cartShopping,
              onTap: () async {
                Get.offAllNamed("products");
              },
            ),
            SizedBox(height: Get.height * 0.02),
            MyListTile(
              title: "الهدايا",
              iconData: Icons.card_giftcard,
              onTap: () async {
                Get.offAllNamed("gifts");
              },
            ),
            SizedBox(height: Get.height * 0.02),
            MyListTile(
              title: "الوكلاء",
              iconData: Icons.people_alt_outlined,
              onTap: () {
                Get.offAllNamed("agents");
              },
            ),
            SizedBox(height: Get.height * 0.02),
            MyListTile(
              title: "من نحن",
              iconData: Icons.info_outline,
              onTap: () {
                Get.offAllNamed("aboutus");
              },
            ),
            SizedBox(height: Get.height * 0.02),
            MyListTile(
              title: "الوكالات",
              iconData: Icons.assignment_ind_outlined,
              onTap: () {
                Get.offAllNamed("agentscorp");
              },
            ),
            SizedBox(height: Get.height * 0.02),
            MyListTile(
              title: "مشاركة التطبيق",
              iconData: Icons.share_outlined,
              onTap: () async {
                Share.share('https://example.com');
              },
            ),
            SizedBox(height: Get.height * 0.05),
            MyListTile(
              title: "تسجيل الخروج",
              iconData: Icons.exit_to_app,
              color: Colors.red,
              onTap: () {
                UserController.logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function() onTap;
  final Color color;
  const MyListTile(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Get.theme.colorScheme.onPrimary),
      child: ListTile(
        leading: Icon(
          iconData,
          color: color,
        ),
        title: Text(
          title,
          style: Get.textTheme.bodyMedium!.copyWith(color: color),
        ),
        onTap: onTap,
      ),
    );
  }
}
