import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificacaoService {
  final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> inicializar() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await plugin.initialize(settings: settings);
  }

  Future<void> mostrarNotificacao() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'canal_principal',
      'Canal Principal',
      channelDescription: 'Notificações principais do aplicativo',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await plugin.show(
      id: 1,
      title: 'Olá!',
      body: 'Esta é uma notificação do aplicativo.',
      notificationDetails: details,
    );
  }

  Future<void> solicitarPermissao() async {
  await plugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
  }
}