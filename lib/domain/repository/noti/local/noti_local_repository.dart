import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotiLocalRepository {
  Future initializeLocalNoti(
    Function(int id, String? title, String? body, String? payload)
        onDidReceiveLocalNotification,
    // Function(NotificationResponse response)
    //     onDidReceiveBackgroundNotificationResponse,
    Function(NotificationResponse reponse) onDidReceiveNotificationResponse,
  );
  Future showNoti({required int id, required String title, required String body});
}
