import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class FCMService extends GetxService {
  static FCMService get to => Get.find();

  StreamSubscription? onMessageListener;
  StreamSubscription? onMessageOpenedAppListener;

  final _localNotification = FlutterLocalNotificationsPlugin();
  final _firebaseMessaging = FirebaseMessaging.instance;
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  @override
  onInit() async {
    super.onInit();

    await _localNotification
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _localNotification.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
        ), onDidReceiveNotificationResponse: (NotificationResponse details) async {
      if (kDebugMode) print('onDidReceiveNotificationResponse - payload: ${details.payload}');
    });

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      if (kDebugMode) print(initialMessage.data);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      if (kDebugMode) {
        print('onMessageOpenedApp - notification: ${message.notification}');
        print('onMessageOpenedApp - data: ${message.data}');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (kDebugMode) {
        print('onMessage - notification: ${message.notification}');
        print('onMessage - data: ${message.data}');
      }
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {}).onError((err) {
      if (kDebugMode) print(err);
    });
  }

  Future<String?> get fcmToken async {
    if (Platform.isIOS) await _firebaseMessaging.getAPNSToken();
    return await _firebaseMessaging.getToken();
  }
}
