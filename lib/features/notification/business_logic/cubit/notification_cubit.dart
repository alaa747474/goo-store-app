import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';

import 'package:goo_store_app/core/utils/local_notifications.dart';
import 'package:goo_store_app/features/notification/data/model/notification_model.dart';
import 'package:goo_store_app/features/notification/data/repository/notification_repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(
    this._notificationRepository,
    this._messaging,
    this._localNotificationService,
  ) : super(NotificationInitial());
  final NotificationRepository _notificationRepository;
  final FirebaseMessaging _messaging;
  final LocalNotificationService _localNotificationService;
  Future<void> sendFCMNotification(
      {required String title, required String body}) async {
    String? deviceToken = await _messaging.getToken();
    NotificationModel notificationModel = NotificationModel(
        to: deviceToken,
        notification: Notification(
          title: title,
          body: body,
        ));
    _notificationRepository.sendFCMNotification(
        notificationModel: notificationModel);
  }
  void onMessage() {
    FirebaseMessaging.onMessage.listen((event) {
      showNotificationBar(
          title: event.notification!.title!, body: event.notification!.body!);
    });
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    showNotificationBar(
        title: message.notification!.title!, body: message.notification!.body!);
  }

  void configerFCM() {
    onMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
    void showNotificationBar({required String title, required String body}) {
    _localNotificationService.showNotification(title: title, body: body);
  }
}
