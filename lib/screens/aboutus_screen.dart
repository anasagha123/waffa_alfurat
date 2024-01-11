import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/components/contact_us_card.dart';
import 'package:waffat_alfurat/components/my_drawer.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.03,
              ),
              child: Image.asset(
                "assets/images/waffa_logo.png",
                height: Get.height * 0.22,
              ),
            ),
            Stack(
              children: [
                Positioned(
                  width: Get.width,
                  top: Get.height * 0.02,
                  child: const Divider(),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("وسائل التواصل"),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ContactUsCard(
                  label: "Facebook",
                  color: Colors.blue,
                  iconData: FontAwesomeIcons.facebook,
                  url:
                      "https://www.facebook.com/profile.php?id=100069528553856&mibextid=ZbWKwL",
                ),
                SizedBox(width: Get.width * 0.1),
                const ContactUsCard(
                  label: "Whatsapp",
                  color: Colors.green,
                  iconData: FontAwesomeIcons.whatsapp,
                  url: "https://wa.me/+9647851000172",
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ContactUsCard(
                  label: "الجوال",
                  color: Colors.red,
                  iconData: Icons.phone_outlined,
                  url: "tel:07851000172",
                ),
                SizedBox(width: Get.width * 0.1),
                const ContactUsCard(
                  label: "العنوان",
                  color: Colors.teal,
                  iconData: FontAwesomeIcons.mapLocation,
                  url:
                      "https://maps.google.com/?cid=16064460715304373148&entry=gps",
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.05, horizontal: Get.width * 0.04),
              child: Text(
                aboutus,
                maxLines: 15,
                textAlign: TextAlign.justify,
                style: Get.textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}

const String aboutus =
    "شركتنا مختصة في بيع القابلات الكهربائية  بالإضافة إلى منتجات أخرى متنوعة تلبي احتياجات عملائنا في مجال الطاقة الكهربائية، منتجاتنا تشمل مجموعة واسعة من القابلات الكهربائية ذات الجودة العالية والأداء الممتاز ، نحن نفخر بأن نكون وكلاء لشركات عالمية مرموقة في مجال الطاقة الكهربائية مما يمكننا من تزويد عملائنا بأحدث التقنيات والحلول المبتكرة.";
