// lib/services/notificacion_service.dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificacionService {
  NotificacionService._();

  static final _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> inicializar(int hora) async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _plugin.initialize(const InitializationSettings(android: android));
    final androidPlugin =
        _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.requestNotificationsPermission();
    await reprogramar(hora);
  }

  static Future<void> reprogramar(int hora) async {
    try {
      await _plugin.cancel(0);
      await _plugin.zonedSchedule(
        0,
        '👑 Mi Imperio te espera',
        '¡Hora de tu lección de hoy! Cada día que aprendes te acerca a la libertad financiera 🦋',
        _proximaHora(hora),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'diaria',
            'Recordatorio Diario',
            channelDescription: 'Recordatorio diario de la app',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (_) {}
  }

  static tz.TZDateTime _proximaHora(int hora) {
    final ahora = tz.TZDateTime.now(tz.local);
    var prog =
        tz.TZDateTime(tz.local, ahora.year, ahora.month, ahora.day, hora, 0);
    if (prog.isBefore(ahora)) prog = prog.add(const Duration(days: 1));
    return prog;
  }
}
