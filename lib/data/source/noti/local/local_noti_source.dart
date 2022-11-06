import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiLocalDatSource {
  NotiLocalDatSource();

  final localNotificationService = FlutterLocalNotificationsPlugin();

  Future initializeLocalNoti(
    Function(int id, String? title, String? body, String? payload)
        onDidReceiveLocalNotification,
    // Function(NotificationResponse) onDidReceiveBackgroundNotificationResponse,
    Function(NotificationResponse) onDidReceiveNotificationResponse,
  ) async {
    // //request permission
    // localNotificationService
    //     .resolvePlatformSpecificImplementation<
    //         IOSFlutterLocalNotificationsPlugin>()!
    //     .requestPermissions(alert: true, badge: true, sound: true);
    //android init
    const AndroidInitializationSettings androidSetting =
        AndroidInitializationSettings("@drawable/noti_icon");
    //ios init
    final DarwinInitializationSettings iosSetting =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      notificationCategories: [
        DarwinNotificationCategory(
          "identifier",
          actions: [
            DarwinNotificationAction.text(
              "identifier",
              "title",
              buttonTitle: "button title",
              options: {
                DarwinNotificationActionOption.foreground,
              },
            ),
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
            DarwinNotificationCategoryOption.allowAnnouncement,
          },
        ),
      ],
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidSetting,
      iOS: iosSetting,
    );
    await localNotificationService.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse:
      // onDidReceiveBackgroundNotificationResponse,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  Future<NotificationDetails> notificationDetails() async {
    const AndroidNotificationDetails androidDetail = AndroidNotificationDetails(
      "channel_id",
      "channel_name",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );
    const DarwinNotificationDetails iosDetail = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    return const NotificationDetails(android: androidDetail, iOS: iosDetail);
  }
}
