// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'providers/app_provider.dart';
import 'screens/pantalla_dashboard.dart';
import 'screens/pantalla_educacion.dart';
import 'screens/pantalla_mercado.dart';
import 'screens/pantalla_onboarding.dart';
import 'screens/pantalla_misiones.dart';
import 'screens/pantalla_metas.dart';
import 'screens/pantalla_perfil.dart';
import 'theme.dart';

// ─────────────────────────────────────────────
//  NOTIFICACIONES
// ─────────────────────────────────────────────
final FlutterLocalNotificationsPlugin notificaciones = FlutterLocalNotificationsPlugin();

Future<void> inicializarNotificaciones() async {
  tz.initializeTimeZones();
  const android = AndroidInitializationSettings('@mipmap/ic_launcher');
  const settings = InitializationSettings(android: android);
  await notificaciones.initialize(settings);

  // Pedir permisos en Android 13+
  final androidPlugin = notificaciones.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  await androidPlugin?.requestNotificationsPermission();

  // Programar notificación diaria a las 4pm
  await _programarNotificacionDiaria();
}

Future<void> _programarNotificacionDiaria() async {
  try {
    await notificaciones.zonedSchedule(
      0,
      '👑 Mi Imperio te espera',
      '¡Hora de tu lección de hoy! Cada día que aprendes te acerca a la libertad financiera 🦋',
      _proximaHora(16, 0),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'diaria', 'Recordatorio Diario',
          channelDescription: 'Recordatorio diario de la app',
          importance: Importance.high, priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  } catch (_) {
    // Silencioso si falla (emuladores sin permisos)
  }
}

tz.TZDateTime _proximaHora(int hora, int minuto) {
  final ahora = tz.TZDateTime.now(tz.local);
  var programado = tz.TZDateTime(tz.local, ahora.year, ahora.month, ahora.day, hora, minuto);
  if (programado.isBefore(ahora)) programado = programado.add(const Duration(days: 1));
  return programado;
}

// ─────────────────────────────────────────────
//  MAIN
// ─────────────────────────────────────────────
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light));
  await inicializarNotificaciones();

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const MiImperioApp(),
    ),
  );
}

class MiImperioApp extends StatelessWidget {
  const MiImperioApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Imperio 👑',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const _RootRouter(),
    );
  }
}

class _RootRouter extends StatelessWidget {
  const _RootRouter();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        if (!app.onboardingCompletado) return const PantallaOnboarding();
        return const PantallaHome();
      },
    );
  }
}

// ─────────────────────────────────────────────
//  NAVEGACIÓN PRINCIPAL — 4 tabs
// ─────────────────────────────────────────────
class PantallaHome extends StatefulWidget {
  const PantallaHome({super.key});
  @override
  State<PantallaHome> createState() => _PantallaHomeState();
}

class _PantallaHomeState extends State<PantallaHome> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final esDiaEducacion = app.esDiaEducacion;

    final paginas = [
      const PantallaDashboard(),
      esDiaEducacion ? const PantallaEducacion() : const PantallaMercado(),
      const PantallaMisiones(),
      const PantallaMetas(),
      const PantallaPerfil(),
    ];

    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
        child: KeyedSubtree(key: ValueKey(_tab), child: paginas[_tab]),
      ),
      bottomNavigationBar: _buildNavBar(app, esDiaEducacion),
    );
  }

  Widget _buildNavBar(AppProvider app, bool esDiaEducacion) {
    final items = [
      _NavItem('🏠', 'Inicio'),
      _NavItem(esDiaEducacion ? '📚' : '🏪', esDiaEducacion ? 'Academia' : 'Tienda'),
      _NavItem('🎯', 'Misiones'),
      _NavItem('🏆', 'Metas'),
      _NavItem(app.avatarActual, 'Perfil'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        border: const Border(top: BorderSide(color: Color(0xFF252840), width: 1)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.4), blurRadius: 20, offset: const Offset(0, -4))],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (i) => _buildNavItem(i, items[i])),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, _NavItem item) {
    final isActive = _tab == index;
    return GestureDetector(
      onTap: () => setState(() => _tab = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: EdgeInsets.symmetric(horizontal: isActive ? 18 : 10, vertical: 8),
        decoration: BoxDecoration(
          gradient: isActive ? const LinearGradient(colors: AppColors.gradienteHero) : null,
          borderRadius: BorderRadius.circular(14),
          boxShadow: isActive ? [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.35), blurRadius: 12)] : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(item.emoji, style: const TextStyle(fontSize: 19)),
            if (isActive) ...[
              const SizedBox(width: 6),
              Text(item.label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800)),
            ],
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final String emoji;
  final String label;
  const _NavItem(this.emoji, this.label);
}
