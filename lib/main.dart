import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/screens/aboutus_screen.dart';
import 'package:waffat_alfurat/screens/agents_screen.dart';
import 'package:waffat_alfurat/screens/agents_corp_screen.dart';
import 'package:waffat_alfurat/screens/gifts_screen.dart';
import 'package:waffat_alfurat/screens/home_screen.dart';
import 'package:waffat_alfurat/screens/login_screen.dart';
import 'package:waffat_alfurat/screens/products_screen.dart';
import 'package:waffat_alfurat/screens/profile_screen.dart';
import 'package:waffat_alfurat/screens/register_screen.dart';
import 'package:waffat_alfurat/screens/user_type_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserController.initSharedPrefrences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar"),
      initialRoute: "userType",
      routes: {
        "home": (ctx) => HomeScreen(),
        "login": (ctx) => LoginScreen(),
        "register": (ctx) => RegisterScreen(),
        "aboutus": (ctx) => const AboutusScreen(),
        "userType": (ctx) => const UserTypeScreen(),
        "profile": (ctx) => const ProfileScreen(),
        "agentscorp": (ctx) => const AgentsCorpScreen(),
        "agents": (ctx) => const AgentsScreen(),
        "products": (ctx) => const ProductsScreen(),
        "gifts": (ctx) => const GiftsScreen(),
      },
      theme: ThemeData(
        fontFamily: "Cario",
        colorScheme: const ColorScheme.light(
          primary: Colors.lightBlue,
          onPrimary: Colors.white,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: Get.textScaleFactor * 14),
          bodyMedium: TextStyle(fontSize: Get.textScaleFactor * 18),
          bodyLarge: TextStyle(fontSize: Get.textScaleFactor * 26),
        ),
      ),
    );
  }
}
