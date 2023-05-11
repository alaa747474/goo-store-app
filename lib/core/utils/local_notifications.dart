
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

 static void initLocalNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOS = const DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestCriticalPermission: true,
        requestSoundPermission: true);
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  NotificationDetails notificationDetalis() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channel_name',
            playSound: true,
            importance: Importance.max,
            priority: Priority.high),
        iOS: DarwinNotificationDetails());
  }

  Future<void> showNotification(
      {required String title, required String body}) async {
    return await flutterLocalNotificationsPlugin.show(
        010224, title, body, notificationDetalis());
  }
}
