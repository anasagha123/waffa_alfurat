import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffat_alfurat/controllers/user_controller.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';
import 'package:waffat_alfurat/screens/aboutus_screen.dart';
import 'package:waffat_alfurat/screens/agents_screen.dart';
import 'package:waffat_alfurat/screens/agents_corp_screen.dart';
import 'package:waffat_alfurat/screens/gifts_screen.dart';
import 'package:waffat_alfurat/screens/home_screen.dart';
import 'package:waffat_alfurat/screens/invoice_screen.dart';
import 'package:waffat_alfurat/screens/login_screen.dart';
import 'package:waffat_alfurat/screens/products_screen.dart';
import 'package:waffat_alfurat/screens/profile_screen.dart';
import 'package:waffat_alfurat/screens/register_screen.dart';
import 'package:waffat_alfurat/screens/user_type_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar"),
      initialRoute:
          UserController.userType == UserType.none ? "userType" : "home",
      routes: {
        "home": (ctx) => HomeScreen(),
        "login": (ctx) => LoginScreen(),
        "register": (ctx) => RegisterScreen(),
        "aboutus": (ctx) => const AboutusScreen(),
        "userType": (ctx) => const UserTypeScreen(),
        "profile": (ctx) => ProfileScreen(),
        "agentscorp": (ctx) => const AgentsCorpScreen(),
        "agents": (ctx) => const AgentsScreen(),
        "products": (ctx) => ProductsScreen(),
        "gifts": (ctx) => GiftsScreen(),
        "invoice": (ctx) => InvoiceScreen(),
      },
      theme: ThemeData(
        fontFamily: "Cario",
        colorScheme: const ColorScheme.light(
          primary: Colors.lightBlue,
          onPrimary: Colors.white,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: Get.textScaleFactor * 12),
          bodyMedium: TextStyle(fontSize: Get.textScaleFactor * 16),
          bodyLarge: TextStyle(fontSize: Get.textScaleFactor * 22),
        ),
      ),
    );
  }
}

initApp() async {
  await UserController.initSharedPrefrences();
  DioHelper.init();
}
