import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

import 'notification_service.dart';

@LazySingleton(as: NotificationService)
class FirebaseNotificationService extends NotificationService {
  final _instance = FirebaseMessaging.instance;

  StreamSubscription? _notificationSubscription;

  @override
  Future<bool> requestPermission() async {
    try {
      final result = await _instance.requestPermission();
      return result.alert == AppleNotificationSetting.enabled;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> init({
    String? externalUserId,
    required NotificationDelegate notificationDelegate,
  }) async {
    if (isInitialized) {
      return;
    }
    setIsInitialized();
    delegate = notificationDelegate;
    final startTime = DateTime.now();
    await _instance.getToken().then((token) async {
      log('[FirebaseCloudMessaging] init FCM token $token', time: startTime);
    });

    await _instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    final initMessage = await _instance.getInitialMessage();
    if (initMessage != null) {
      delegate.onMessageOpenedApp(FStoreNotificationItem(
        id: initMessage.data['id'] ?? '',
        title: initMessage.notification?.title ?? '',
        body: initMessage.notification?.body ?? '',
        data: initMessage.data,
        creationTime: DateTime.now(),
      ));
    }

    _notificationSubscription = FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        final notification = message.notification;
        final android = message.notification?.android;
        if (notification != null && android != null && Platform.isAndroid) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                // other properties...
              ),
              iOS: const DarwinNotificationDetails(),
            ),
            // payload: 'Notification'
          );
        }

        delegate.onMessage(FStoreNotificationItem(
          id: message.data['id'] ?? '',
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          data: message.data,
          creationTime: DateTime.now(),
        ));
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // printLog('Notification OpenedApp triggered');
      delegate.onMessageOpenedApp(FStoreNotificationItem(
        id: message.data['id'] ?? '',
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        data: message.data,
        creationTime: DateTime.now(),
      ));
    });
  }

  @override
  void disableNotification() {
    _instance.setForegroundNotificationPresentationOptions(
      alert: false, // Required to display a heads up notification
      badge: false,
      sound: false,
    );
    if (_notificationSubscription != null) {
      _notificationSubscription!.pause();
    }
  }

  @override
  void enableNotification() {
    _instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    if (_notificationSubscription != null) {
      _notificationSubscription!.resume();
    }
  }

  @override
  void setExternalId(String? userId) {}

  @override
  void removeExternalId() {}
}

class FStoreNotificationItem {
  final String id;
  final String title;
  final String body;
  final bool seen;
  final Map? data;
  final DateTime creationTime;
  const FStoreNotificationItem({
    required this.id,
    required this.title,
    required this.body,
    this.data,
    this.seen = false,
    required this.creationTime,
  });

  factory FStoreNotificationItem.fromJson(Map<String, dynamic> json) {
    return FStoreNotificationItem(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      seen: json['seen'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>,
      creationTime: DateTime.parse(json['creationTime'] as String),
    );
  }

  FStoreNotificationItem copyWith({
    String? id,
    String? title,
    String? body,
    bool? seen,
    Map? data,
    DateTime? creationTime,
  }) {
    return FStoreNotificationItem(
      id: id ?? this.id,
      title: title ?? this.title,
      seen: seen ?? this.seen,
      body: body ?? this.body,
      data: Map<String, dynamic>.from(
          jsonDecode(jsonEncode(data ?? this.data ?? {}))),
      creationTime: creationTime ?? this.creationTime,
    );
  }

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);
    writeNotNull('title', title);
    writeNotNull('body', body);
    writeNotNull('seen', seen);
    writeNotNull('data', data);
    writeNotNull('creationTime', creationTime.toString());
    return val;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FStoreNotificationItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          creationTime == other.creationTime;

  @override
  int get hashCode => id.hashCode ^ creationTime.hashCode;
}
