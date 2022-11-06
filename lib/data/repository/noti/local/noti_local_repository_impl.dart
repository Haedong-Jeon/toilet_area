import 'package:flutter_local_notifications_platform_interface/src/types.dart';
import 'package:toilet_area/data/source/noti/local/local_noti_source.dart';
import 'package:toilet_area/domain/repository/noti/local/noti_local_repository.dart';

class NotiLocalRepositoryImpl extends NotiLocalRepository {
  final NotiLocalDatSource notiLocalDatSource;

  NotiLocalRepositoryImpl(this.notiLocalDatSource);

  @override
  Future initializeLocalNoti(

      ///id, title, body, payload 순서
      Function(int id, String? title, String? body, String? payload)
          onDidReceiveLocalNotification,
      // Function(NotificationResponse response)
      //     onDidReceiveBackgroundNotificationResponse,
      Function(NotificationResponse reponse)
          onDidReceiveNotificationResponse) async {
    // TODO: implement initializeLocalNoti
    await notiLocalDatSource.initializeLocalNoti(
      onDidReceiveLocalNotification,
      // onDidReceiveBackgroundNotificationResponse,
      onDidReceiveNotificationResponse,
    );
  }

  @override
  Future showNoti(
      {required int id, required String title, required String body}) async {
    final details = await notiLocalDatSource.notificationDetails();
    await notiLocalDatSource.localNotificationService
        .show(id, title, body, details);
  }
}
