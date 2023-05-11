
import 'package:goo_store_app/features/notification/data/model/notification_model.dart';

abstract class BaseNotificationRepository {
  Future<void>sendFCMNotification({required NotificationModel notificationModel});
}