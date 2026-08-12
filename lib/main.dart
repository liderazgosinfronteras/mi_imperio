// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'firebase_options.dart';
import 'providers/app_provider.dart';
import 'services/firebase_service.dart';
import 'screens/pantalla_dashboard.dart';
import 'screens/pantalla_educacion.dart';
import 'screens/pantalla_mercado.dart';
import 'screens/pantalla_onboarding.dart';
import 'screens/pantalla_misiones.dart';
import 'screens/pantalla_metas.dart';
import 'screens/pantalla_perfil.dart';
import 'screens/pantalla_juegos.dart';
import 'theme.dart';
import 'utils/sound_player.dart';

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
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    FirebaseService.markReady(); // marca Firebase como listo antes de que el usuario interactúe
    FirebaseService.silentAutoLogin(); // fire-and-forget: da UID antes de que abran Imperio Builder
  } catch (_) {}
  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light));
    await inicializarNotificaciones();
  }

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
//  NAVEGACIÓN PRINCIPAL — 7 tabs
// ─────────────────────────────────────────────
class PantallaHome extends StatefulWidget {
  const PantallaHome({super.key});
  @override
  State<PantallaHome> createState() => _PantallaHomeState();
}

class _PantallaHomeState extends State<PantallaHome> {
  int _tab = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final notifs = context.read<AppProvider>().consumirNotificaciones();
      for (final notif in notifs) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('🎯 ¡Misión completada! $notif'),
          backgroundColor: const Color(0xFF1B5E20),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          duration: const Duration(seconds: 3),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    final esDiaEducacion = app.esDiaEducacion;

    final paginas = [
      const PantallaDashboard(),
      const PantallaMercado(),
      const PantallaEducacion(),
      const PantallaJuegos(),
      const PantallaMisiones(),
      const PantallaMetas(),
      const PantallaPerfil(),
    ];

    // Ocultar FAB en el tab de Ventas (ya tiene su propio formulario) y en Juegos
    final mostrarFab = _tab != 1 && _tab != 3;

    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
        child: KeyedSubtree(key: ValueKey(_tab), child: paginas[_tab]),
      ),
      floatingActionButton: mostrarFab
          ? FloatingActionButton.extended(
              onPressed: () => _mostrarRegistroVenta(context, app),
              backgroundColor: const Color(0xFF1B5E20),
              icon: const Text('💰', style: TextStyle(fontSize: 20)),
              label: const Text('Registrar Venta',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Color(0xFF4CAF50), width: 1.5),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: _buildNavBar(app, esDiaEducacion),
    );
  }

  void _mostrarRegistroVenta(BuildContext context, AppProvider app) {
    final montoCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ModalRegistroVenta(
        montoCtrl: montoCtrl,
        descCtrl: descCtrl,
        onRegistrar: (monto, desc) {
          app.registrarVenta(monto, desc);
          try { SoundPlayer.venta(); } catch (_) {}
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('✅ Venta de \$${monto.toStringAsFixed(2)} registrada'),
            backgroundColor: const Color(0xFF2E7D32),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            duration: const Duration(seconds: 2),
          ));
        },
      ),
    ).whenComplete(() {
      montoCtrl.dispose();
      descCtrl.dispose();
    });
  }

  Widget _buildNavBar(AppProvider app, bool esDiaEducacion) {
    final items = [
      _NavItem('🏠', 'Inicio'),
      const _NavItem('💰', 'Ventas'),
      const _NavItem('📚', 'Academia'),
      _NavItem('🎮', 'Juegos'),
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

// ─────────────────────────────────────────────
//  MODAL REGISTRO RÁPIDO DE VENTA
// ─────────────────────────────────────────────
class _ModalRegistroVenta extends StatefulWidget {
  final TextEditingController montoCtrl;
  final TextEditingController descCtrl;
  final void Function(double monto, String desc) onRegistrar;
  const _ModalRegistroVenta({required this.montoCtrl, required this.descCtrl, required this.onRegistrar});

  @override
  State<_ModalRegistroVenta> createState() => _ModalRegistroVentaState();
}

class _ModalRegistroVentaState extends State<_ModalRegistroVenta> {
  String _error = '';

  double? get _monto => double.tryParse(widget.montoCtrl.text.trim());

  @override
  Widget build(BuildContext context) {
    final monto = _monto;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottom),
      decoration: const BoxDecoration(
        color: Color(0xFF0D1A0E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: Color(0xFF4CAF50), width: 2)),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        // Manija
        Container(width: 44, height: 4,
          decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2))),
        const SizedBox(height: 16),

        // Título
        const Row(children: [
          Text('💰', style: TextStyle(fontSize: 28)),
          SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Registrar Venta', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
            Text('¿Cuánto vendiste hoy?', style: TextStyle(color: Colors.white54, fontSize: 12)),
          ]),
        ]),
        const SizedBox(height: 20),

        // Campo monto
        TextField(
          controller: widget.montoCtrl,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))],
          style: const TextStyle(color: Color(0xFF4CAF50), fontSize: 32, fontWeight: FontWeight.w900),
          decoration: InputDecoration(
            prefixText: '\$  ',
            prefixStyle: const TextStyle(color: Color(0xFF4CAF50), fontSize: 28, fontWeight: FontWeight.w900),
            hintText: '0.00',
            hintStyle: const TextStyle(color: Colors.white24, fontSize: 28),
            filled: true,
            fillColor: const Color(0xFF0A2A0B),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFF4CAF50))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.white24)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2)),
          ),
          onChanged: (_) => setState(() => _error = ''),
        ),
        const SizedBox(height: 12),

        // Campo descripción
        TextField(
          controller: widget.descCtrl,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Descripción (opcional): productos, nombre cliente...',
            hintStyle: const TextStyle(color: Colors.white38, fontSize: 12),
            filled: true,
            fillColor: const Color(0xFF0A2A0B),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.white24)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.white24)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFF4CAF50))),
          ),
        ),
        const SizedBox(height: 12),

        // Preview distribución 30/40/30
        if (monto != null && monto > 0) ...[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF0A2A0B),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(children: [
              _chip('🔄 30%', '\$${(monto * 0.30).toStringAsFixed(2)}', const Color(0xFFFFD700)),
              const SizedBox(width: 6),
              _chip('🛍️ 40%', '\$${(monto * 0.40).toStringAsFixed(2)}', const Color(0xFFE91E63)),
              const SizedBox(width: 6),
              _chip('📈 30%', '\$${(monto * 0.30).toStringAsFixed(2)}', const Color(0xFF4CAF50)),
            ]),
          ),
          const SizedBox(height: 12),
        ],

        if (_error.isNotEmpty) ...[
          Text(_error, style: const TextStyle(color: Colors.redAccent, fontSize: 12)),
          const SizedBox(height: 8),
        ],

        // Botón registrar
        GestureDetector(
          onTap: () {
            final m = _monto;
            if (m == null || m <= 0) {
              setState(() => _error = 'Ingresa un monto válido mayor a \$0');
              return;
            }
            if (m > 9999) {
              setState(() => _error = 'El monto máximo es \$9,999');
              return;
            }
            widget.onRegistrar(m, widget.descCtrl.text.trim());
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF1B5E20), Color(0xFF4CAF50)]),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF4CAF50).withValues(alpha: 0.6)),
              boxShadow: [BoxShadow(color: const Color(0xFF4CAF50).withValues(alpha: 0.3), blurRadius: 12)],
            ),
            child: const Center(child: Text('✅ Registrar Venta',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900))),
          ),
        ),
      ]),
    );
  }

  Widget _chip(String label, String valor, Color color) => Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(children: [
        Text(label, style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.w800)),
        Text(valor, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w900)),
      ]),
    ),
  );
}
