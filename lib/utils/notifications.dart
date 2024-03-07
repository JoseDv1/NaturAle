import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // List of notifications to show.
  List<String> notifications = [
    "Comer frutas y verduras de temporada tiene muchas ventajas. Son más baratas, más sabrosas y más nutritivas. Además, son más respetuosas con el medio ambiente y con los animales.",
    "Seguir una dieta saludable es muy importante para tu salud y tu bienestar. Es importante que comas frutas y verduras todos los días.",
    "Come siempre a las mismas horas. Sabemos que hoy en día esto puede resultar complicado debido a nuestro ritmo de vida, pero es conveniente que te esfuerces en conseguirlo",
    "Haz de la variedad de frutas, vegetales y granos integrales, la base de tu alimentación",
    "Desayuna todos los días",
    "Reduce el consumo de sal y de azúcar",
    "Sustituye las grasas trans y saturadas por las poliinsaturadas: minimiza el consumo de ultraprocesados",
  ];

  // Create a function to initialize the notifications.
  Future<void> initNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // Initialize the timezone
    tz.initializeTimeZones();
    // Get the local timezone
    tz.setLocalLocation(tz.getLocation('America/Bogota'));

    // Call the function to schedule the notifications.
    scheduleNotificacion(1);
  }

  //Create a function to show the notification.
  Future<void> showNotificacion(int id) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '1',
      'Naturale',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id,
      'Naturale',
      notifications[Random().nextInt(notifications.length) + 1],
      notificationDetails,
    );
  }

  // Create a function to schedule the notifications to show and then schelude
  Future<void> scheduleNotificacion(id) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '1',
      'Naturale',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'Naturale',
      notifications[Random().nextInt(notifications.length) + 1],
      tz.TZDateTime.now(tz.local).add(const Duration(hours: 4)),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );

    // When the notification is shown call the function to show the next notification.
    Timer(const Duration(hours: 4), () {
      scheduleNotificacion(id + 1);
    });
  }
}
