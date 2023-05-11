import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/notification/data/model/notification_model.dart';
import 'package:goo_store_app/features/notification/data/repository/base_notification_repository.dart';

class NotificationRepository extends BaseNotificationRepository {
  final DioHelper _dioHelper;

  NotificationRepository(this._dioHelper);
  @override
  Future<void> sendFCMNotification(
      {required NotificationModel notificationModel}) async {
    await _dioHelper.postData(
        token: 'key=${AppEndPoints.cloudMessagingServerKey}',
        baseUrl: AppEndPoints.fcmbaseUrl,
        endPoint: '',
        data: notificationModel.toJson());
  }
}
