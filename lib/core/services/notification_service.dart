import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  void setIsInitialized() {
    _isInitialized = true;
  }

  NotificationService() {
    var initSetting = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    flutterLocalNotificationsPlugin.initialize(
      initSetting,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  final channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  late final NotificationDelegate delegate;

  void init({
    /// OneSignal only
    String? externalUserId,
    required NotificationDelegate notificationDelegate,
  });

  Future<bool> requestPermission() async {
    // request permissions
    /// Case unknown - First time open the app
    final status = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (status.authorizationStatus == AuthorizationStatus.authorized) {
      return true;
    }
    return false;
  }

  Future<bool> isGranted() async {
    final status = await FirebaseMessaging.instance.getNotificationSettings();
    if (status.authorizationStatus == AuthorizationStatus.authorized) {
      return true;
    }
    return false;
  }

  void disableNotification();

  void enableNotification();

  void setExternalId(String? userId);
  void removeExternalId();
}

mixin NotificationDelegate {
  void onMessage(Object notification);

  void onMessageOpenedApp(Object notification);
}
