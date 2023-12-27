import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsCard extends StatelessWidget {
  final Color color;
  final String label;
  final IconData iconData;
  final String url;
  final String scheme;

  const ContactUsCard({
    super.key,
    required this.color,
    required this.label,
    required this.iconData,
    required this.url,
    required this.scheme,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
        width: Get.width * 0.4,
        height: Get.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            Text(label,
                style: Get.textTheme.bodyMedium!.copyWith(color: color)),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    Uri uri = Uri(
      scheme: scheme,
      path: url,
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
