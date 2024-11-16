import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:waffaa_alfurat/controllers/user_controller.dart';
import 'package:waffaa_alfurat/firebase_options.dart';
import 'package:waffaa_alfurat/network/remote/http_client.dart';
import 'package:waffaa_alfurat/screens/aboutus_screen.dart';
import 'package:waffaa_alfurat/screens/agents_screen.dart';
import 'package:waffaa_alfurat/screens/brands_screen.dart';
import 'package:waffaa_alfurat/screens/gifts_screen.dart';
import 'package:waffaa_alfurat/screens/home_screen.dart';
import 'package:waffaa_alfurat/screens/invoice_screen.dart';
import 'package:waffaa_alfurat/screens/login_screen.dart';
import 'package:waffaa_alfurat/screens/posts_screen.dart';
import 'package:waffaa_alfurat/screens/products_screen.dart';
import 'package:waffaa_alfurat/screens/profile_screen.dart';
import 'package:waffaa_alfurat/screens/register_screen.dart';
import 'package:waffaa_alfurat/screens/splash/splash_screen.dart';
import 'package:waffaa_alfurat/screens/user_type_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar"),
      initialRoute: "splash",
      routes: {
        "home": (ctx) => HomeScreen(),
        "login": (ctx) => LoginScreen(),
        "register": (ctx) => RegisterScreen(),
        "aboutus": (ctx) => const AboutusScreen(),
        "userType": (ctx) => const UserTypeScreen(),
        "profile": (ctx) => ProfileScreen(),
        "brands": (ctx) => const BrandsScreen(),
        "agents": (ctx) => AgentsScreen(),
        "products": (ctx) => ProductsScreen(),
        "gifts": (ctx) => GiftsScreen(),
        "invoice": (ctx) => InvoiceScreen(),
        "posts": (ctx) => PostsScreen(),
        "splash": (ctx) => SplashScreen(),
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

Future<void> initApp() async {
  HttpClient.init();
  await UserController.initSharedPrefrences();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseApi().initNotifications();
  UserController.getSeenPosts();
  UserController.getPosts();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
