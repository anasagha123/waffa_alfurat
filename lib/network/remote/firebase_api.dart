// ignore_for_file: non_constant_identifier_names

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:waffat_alfurat/controllers/home_screen_controller/posts_notification_controller.dart';
import 'package:waffat_alfurat/network/remote/dio_helper.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  Get.toNamed("posts");
  Get.put(PostsNotificationController()).setPostcount();
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    "high_importance_channel",
    "High Importance Notification",
    description: "this channel is used for important notification",
    importance: Importance.high,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    Get.toNamed("posts");
  }

  // Future initLocalNotifications() async {
  //   const iOS = DarwinInitializationSettings();
  //   const android =
  //       AndroidInitializationSettings("assets/images/waffa_logo.png");
  //   const settings = InitializationSettings(android: android, iOS: iOS);
  //   await _localNotifications.initialize(settings);

  //   final platform = _localNotifications.resolvePlatformSpecificImplementation<
  //       AndroidFlutterLocalNotificationsPlugin>();
  //   await platform?.createNotificationChannel(_androidChannel);
  // }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
          ),
        ),
      );
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(provisional: true);
    final FCMToken = await _firebaseMessaging.getToken();
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifications();
    await DioHelper.postData(
      path: EndPoints.postFCMToken,
      data: {
        "token": FCMToken,
      },
    );
    // initLocalNotifications();
  }
}
