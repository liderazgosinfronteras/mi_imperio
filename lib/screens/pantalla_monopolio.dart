// lib/screens/pantalla_monopolio.dart — Monopolio LSF ♟️
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../theme.dart';
import '../utils/sound_player.dart';

// ── Tipos ─────────────────────────────────────────────────────────
enum TEspacio { inicio, propiedad, suerte, conocimiento, impuesto, visita, parking, prision }

// ── Espacio del tablero ───────────────────────────────────────────
class MSpace {
  final int idx;
  final String nombre, emoji;
  final TEspacio tipo;
  final Color? color;
  final int precio;
  final int impuesto;
  const MSpace({
    required this.idx, required this.nombre, required this.emoji, required this.tipo,
    this.color, this.precio = 0, this.impuesto = 0,
  });
}

// ── Propiedad (estado en juego) ───────────────────────────────────
class MProp {
  final int spaceIdx;
  int dueno = -1;
  int casas  = 0;
  MProp(this.spaceIdx);
  int get rentaBase => _tablero[spaceIdx].precio ~/ 10;
  int get renta => casas == 0 ? rentaBase : casas == 1 ? rentaBase * 3 : rentaBase * 7;
  int get costoCasa => _tablero[spaceIdx].precio ~/ 2;
  bool get maxCasas => casas >= 2;
}

// ── Jugador ───────────────────────────────────────────────────────
class MJugador {
  final int id;
  final String nombre, emoji;
  final Color color;
  final bool esIA;
  int pos      = 0;
  int dinero   = 1500;
  bool preso   = false;
  int turnoPreso = 0;
  bool eliminado = false;
  MJugador({required this.id, required this.nombre, required this.emoji,
    required this.color, this.esIA = false});
}

// ── Tablero (20 espacios) ─────────────────────────────────────────
final _tablero = <MSpace>[
  MSpace(idx: 0,  nombre: 'INICIO',              emoji: '🏁', tipo: TEspacio.inicio),
  MSpace(idx: 1,  nombre: 'Puesto de Limonada',  emoji: '🍋', tipo: TEspacio.propiedad, color: const Color(0xFFFF9800), precio: 60),
  MSpace(idx: 2,  nombre: 'Venta de Stickers',   emoji: '🎨', tipo: TEspacio.propiedad, color: const Color(0xFFFF9800), precio: 80),
  MSpace(idx: 3,  nombre: 'Carta de Suerte',      emoji: '🍀', tipo: TEspacio.suerte),
  MSpace(idx: 4,  nombre: 'Repostería Casera',    emoji: '🍪', tipo: TEspacio.propiedad, color: const Color(0xFFE91E63), precio: 100),
  MSpace(idx: 5,  nombre: 'Visita a Prisión',     emoji: '🏛️', tipo: TEspacio.visita),
  MSpace(idx: 6,  nombre: 'Canal de YouTube',     emoji: '🎬', tipo: TEspacio.propiedad, color: const Color(0xFF2196F3), precio: 140),
  MSpace(idx: 7,  nombre: 'Carta de Conocimiento',emoji: '📚', tipo: TEspacio.conocimiento),
  MSpace(idx: 8,  nombre: 'Cafetería',            emoji: '☕', tipo: TEspacio.propiedad, color: const Color(0xFF4CAF50), precio: 180),
  MSpace(idx: 9,  nombre: 'Impuesto Básico',      emoji: '💸', tipo: TEspacio.impuesto, impuesto: 75),
  MSpace(idx: 10, nombre: 'Parking Libre',        emoji: '🅿️', tipo: TEspacio.parking),
  MSpace(idx: 11, nombre: 'Tienda Online',        emoji: '🏪', tipo: TEspacio.propiedad, color: const Color(0xFFFFEB3B), precio: 220),
  MSpace(idx: 12, nombre: 'App Móvil',            emoji: '📱', tipo: TEspacio.propiedad, color: const Color(0xFFFFEB3B), precio: 250),
  MSpace(idx: 13, nombre: 'Carta de Suerte',      emoji: '🍀', tipo: TEspacio.suerte),
  MSpace(idx: 14, nombre: 'Franquicia de Comida', emoji: '🍕', tipo: TEspacio.propiedad, color: const Color(0xFFF44336), precio: 280),
  MSpace(idx: 15, nombre: '¡IR A PRISIÓN!',       emoji: '👮', tipo: TEspacio.prision),
  MSpace(idx: 16, nombre: 'Prop. de Alquiler',    emoji: '🏠', tipo: TEspacio.propiedad, color: const Color(0xFF9C27B0), precio: 300),
  MSpace(idx: 17, nombre: 'Carta de Conocimiento',emoji: '📚', tipo: TEspacio.conocimiento),
  MSpace(idx: 18, nombre: 'Agencia Digital',      emoji: '💻', tipo: TEspacio.propiedad, color: const Color(0xFF9C27B0), precio: 340),
  MSpace(idx: 19, nombre: 'Impuesto de Lujo',     emoji: '💎', tipo: TEspacio.impuesto, impuesto: 200),
];

// ── Cartas ────────────────────────────────────────────────────────
const _suerte = [
  ('🎉', '¡Ganaste un concurso!', 'Tu creatividad te premia: cobras \$150', 150),
  ('🛒', 'Ventas récord', 'Un día increíble en tu negocio: +\$100', 100),
  ('🌧️', 'Día malo de ventas', 'Pierdes \$50 en inventario dañado', -50),
  ('🎁', 'Regalo de cumpleaños', 'Tu familia te da \$75', 75),
  ('🔧', 'Reparación de equipo', 'Pagas \$80 por reparar tu laptop', -80),
  ('📣', 'Marketing viral', 'Tu reels se hizo viral: cobras \$200', 200),
  ('🏥', 'Gasto de salud', 'Consulta médica inesperada: -\$60', -60),
  ('🌟', 'Reseña 5 estrellas', 'Cliente famoso recomienda tu negocio: +\$120', 120),
];

const _conocimiento = [
  ('💡', 'Interés Compuesto', '\$1 invertido hoy vale \$7 en 30 años. ¡Empieza hoy! Cobras \$50.', 50),
  ('📊', 'Activos vs Pasivos', 'Activo = te da dinero. Pasivo = te lo quita. Cobras \$75.', 75),
  ('🏦', 'El poder del ahorro', 'Ahorrar el 20% de tus ingresos cambia tu vida. Cobras \$60.', 60),
  ('💰', 'Flujo de Caja', 'Más entra que sale = libertad financiera. Cobras \$80.', 80),
  ('📈', 'Invertir = crecer', 'Pon tu dinero a trabajar para ti. Cobras \$90.', 90),
  ('🎯', 'Diversificación', 'No pongas todos los huevos en una canasta. Cobras \$70.', 70),
  ('🔄', 'Reinversión', 'Las ganancias reinvertidas se multiplican. Pagas \$40 hoy, ganas más mañana.', -40),
  ('🌱', 'Emprender', 'Resolver problemas reales crea riqueza real. Cobras \$100.', 100),
];

// ── Emojis de jugadores ───────────────────────────────────────────
const _avatares = ['👸', '🦊', '⭐', '🐲'];
const _coloresJ = [Color(0xFF7C3AED), Color(0xFFDB2777), Color(0xFF0284C7), Color(0xFF16A34A)];

// ═══════════════════════════════════════════════════════════════════
//  WIDGET PRINCIPAL
// ═══════════════════════════════════════════════════════════════════
class PantallaMonopolio extends StatefulWidget {
  const PantallaMonopolio({super.key});
  @override
  State<PantallaMonopolio> createState() => _PantallaMonopolioState();
}

class _PantallaMonopolioState extends State<PantallaMonopolio> {
  // ── Config ───────────────────────────────────────────────────────
  int _numJugadores = 2;
  bool _juegoIniciado = false;

  // ── Estado de juego ──────────────────────────────────────────────
  late List<MJugador> _jugadores;
  late List<MProp?>  _props; // indexed by spaceIdx, null if not propiedad
  int  _turnoIdx     = 0;
  bool _esperandoAccion = false; // waiting for player to buy/skip
  bool _terminado    = false;
  List<String> _log  = [];

  // ── Dados ────────────────────────────────────────────────────────
  int  _d1 = 0, _d2 = 0;
  bool _tiro = false;

  // ── Carta activa ─────────────────────────────────────────────────
  (String, String, String, int)? _cartaActiva;

  final _rand = Random();

  // ── Init ─────────────────────────────────────────────────────────
  void _iniciarJuego(int n) {
    _numJugadores = n;
    final nombres = ['Tú', 'Luna', 'Bella', 'Nala'];
    _jugadores = List.generate(n, (i) => MJugador(
      id: i, nombre: nombres[i], emoji: _avatares[i],
      color: _coloresJ[i], esIA: i > 0,
    ));
    _props = List.generate(20, (i) =>
      _tablero[i].tipo == TEspacio.propiedad ? MProp(i) : null);
    _turnoIdx = 0;
    _tiro = false;
    _esperandoAccion = false;
    _terminado = false;
    _log = ['¡Monopolio LSF comenzó! ${_jugadores[0].nombre} va primero.'];
    setState(() => _juegoIniciado = true);
  }

  MJugador get _jugActual => _jugadores[_turnoIdx];

  // ── Tirar dados ──────────────────────────────────────────────────
  void _tirarDados() {
    if (_tiro || _esperandoAccion) return;
    _d1 = _rand.nextInt(6) + 1;
    _d2 = _rand.nextInt(6) + 1;
    final pasos = _d1 + _d2;
    SoundPlayer.dado();
    setState(() => _tiro = true);
    _moverJugador(_jugActual, pasos);
  }

  void _moverJugador(MJugador j, int pasos) {
    final anteriorPos = j.pos;
    j.pos = (j.pos + pasos) % 20;
    // Pasar por INICIO → cobrar $200
    if (j.pos < anteriorPos || (anteriorPos == 0 && pasos > 0)) {
      if (j.pos != 0 || pasos > 0) {
        j.dinero += 200;
        _addLog('${j.emoji} ${j.nombre} pasa por INICIO → cobra \$200');
      }
    }
    setState(() {});
    Future.delayed(const Duration(milliseconds: 400), () => _procesarEspacio(j));
  }

  // ── Procesar espacio ─────────────────────────────────────────────
  void _procesarEspacio(MJugador j) {
    final esp = _tablero[j.pos];
    switch (esp.tipo) {
      case TEspacio.inicio:
        _addLog('${j.emoji} ${j.nombre} está en INICIO. ¡Cobra \$200!');
        j.dinero += 200;
        SoundPlayer.payday();
        _finTurno();
      case TEspacio.parking:
        _addLog('${j.emoji} ${j.nombre} descansa en el Parking Libre. 🅿️');
        SoundPlayer.click();
        _finTurno();
      case TEspacio.visita:
        _addLog('${j.emoji} ${j.nombre} solo visita la prisión. 😄');
        SoundPlayer.click();
        _finTurno();
      case TEspacio.prision:
        j.preso = true; j.pos = 5; j.turnoPreso = 0;
        _addLog('${j.emoji} ${j.nombre} ¡Va a prisión! 👮');
        SoundPlayer.error();
        _finTurno();
      case TEspacio.impuesto:
        final monto = esp.impuesto;
        j.dinero -= monto;
        _addLog('${j.emoji} ${j.nombre} paga impuesto: -\$$monto 💸');
        SoundPlayer.pasivo();
        _verificarQuiebra(j);
        _finTurno();
      case TEspacio.suerte:
        final c = _suerte[_rand.nextInt(_suerte.length)];
        _cartaActiva = c;
        j.dinero += c.$4;
        _addLog('${j.emoji} ${j.nombre} saca carta 🍀: ${c.$2}');
        c.$4 >= 0 ? SoundPlayer.correcto() : SoundPlayer.pasivo();
        setState(() => _esperandoAccion = true);
      case TEspacio.conocimiento:
        final c = _conocimiento[_rand.nextInt(_conocimiento.length)];
        _cartaActiva = c;
        j.dinero += c.$4;
        _addLog('${j.emoji} ${j.nombre} aprende 📚: ${c.$2}');
        c.$4 >= 0 ? SoundPlayer.leccion() : SoundPlayer.pasivo();
        setState(() => _esperandoAccion = true);
      case TEspacio.propiedad:
        _manejarPropiedad(j);
    }
    setState(() {});
  }

  void _manejarPropiedad(MJugador j) {
    final prop = _props[j.pos]!;
    final esp  = _tablero[j.pos];
    if (prop.dueno == -1) {
      // Nadie la tiene — ¿comprar?
      if (j.esIA) {
        if (j.dinero >= esp.precio) { _comprar(j, prop); _finTurno(); }
        else { _addLog('${j.emoji} ${j.nombre} no puede comprar ${esp.nombre}'); _finTurno(); }
      } else {
        setState(() => _esperandoAccion = true);
      }
    } else if (prop.dueno != j.id) {
      final duenoJ = _jugadores[prop.dueno];
      j.dinero -= prop.renta;
      duenoJ.dinero += prop.renta;
      _addLog('${j.emoji} paga \$${prop.renta} de renta a ${duenoJ.emoji} por ${esp.nombre}');
      SoundPlayer.pasivo();
      _verificarQuiebra(j);
      _finTurno();
    } else {
      // Propia — ¿construir casa?
      if (j.esIA && !prop.maxCasas && j.dinero >= prop.costoCasa * 2) {
        _addLog('${j.emoji} ${j.nombre} construye casa en ${esp.nombre} 🏠');
        prop.casas++; j.dinero -= prop.costoCasa;
      } else {
        _addLog('${j.emoji} ${j.nombre} está en su propiedad: ${esp.nombre}');
      }
      _finTurno();
    }
  }

  void _comprar(MJugador j, MProp prop) {
    prop.dueno = j.id;
    j.dinero -= _tablero[prop.spaceIdx].precio;
    _addLog('${j.emoji} ${j.nombre} compra ${_tablero[prop.spaceIdx].nombre} por \$${_tablero[prop.spaceIdx].precio} ✅');
    SoundPlayer.compra();
  }

  void _verificarQuiebra(MJugador j) {
    if (j.dinero < 0) {
      j.eliminado = true;
      j.dinero = 0;
      _addLog('💀 ${j.nombre} ¡quebró! Sale del juego.');
      _verificarFin();
    }
  }

  void _verificarFin() {
    final activos = _jugadores.where((j) => !j.eliminado).toList();
    if (activos.length <= 1) {
      SoundPlayer.victoria();
      setState(() => _terminado = true);
    }
  }

  void _finTurno() {
    setState(() {
      _tiro = false;
      _esperandoAccion = false;
      _cartaActiva = null;
    });
    // Avanzar al siguiente jugador activo
    int siguiente = (_turnoIdx + 1) % _jugadores.length;
    int intentos = 0;
    while (_jugadores[siguiente].eliminado && intentos < _jugadores.length) {
      siguiente = (siguiente + 1) % _jugadores.length;
      intentos++;
    }
    setState(() => _turnoIdx = siguiente);
    // Si el siguiente es IA, auto-jugar después de un momento
    if (_jugadores[siguiente].esIA && !_terminado) {
      Future.delayed(const Duration(milliseconds: 800), _turnoIA);
    }
  }

  void _turnoIA() {
    if (!mounted || _terminado) return;
    final j = _jugActual;
    if (!j.esIA) return;
    if (j.preso) {
      j.preso = false;
      _addLog('${j.emoji} ${j.nombre} sale de prisión.');
      setState(() {});
    }
    _tirarDados();
  }

  void _addLog(String msg) => setState(() {
    _log.insert(0, msg);
    if (_log.length > 20) _log.removeLast();
  });

  // ── Acciones del jugador humano ──────────────────────────────────
  void _accionComprar() {
    final prop = _props[_jugActual.pos];
    if (prop == null) return;
    _comprar(_jugActual, prop);
    setState(() => _esperandoAccion = false);
    _finTurno();
  }

  void _accionPasar() {
    setState(() { _esperandoAccion = false; _cartaActiva = null; });
    _finTurno();
  }

  void _accionConstruir() {
    final prop = _props[_jugActual.pos];
    if (prop == null || prop.dueno != _jugActual.id || prop.maxCasas) return;
    if (_jugActual.dinero < prop.costoCasa) return;
    prop.casas++;
    _jugActual.dinero -= prop.costoCasa;
    _addLog('${_jugActual.emoji} construye casa en ${_tablero[_jugActual.pos].nombre} 🏠');
    SoundPlayer.compra();
    setState(() {});
  }

  // ═══════════════════════════════════════════════════════════════════
  //  BUILD
  // ═══════════════════════════════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    if (!_juegoIniciado) return _buildConfiguracion();
    if (_terminado) return _buildResultados();
    return _buildJuego();
  }

  // ── Pantalla de configuración ─────────────────────────────────────
  Widget _buildConfiguracion() {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white70),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 16),
              const Center(child: Text('♟️', style: TextStyle(fontSize: 72))),
              const SizedBox(height: 12),
              const Center(child: Text('Monopolio LSF',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900))),
              const Center(child: Text('Finanzas en el tablero',
                style: TextStyle(color: Colors.white54, fontSize: 14))),
              const SizedBox(height: 40),
              const Text('¿Cuántas jugadoras?',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 16),
              Row(children: [2, 3, 4].map((n) {
                final sel = _numJugadores == n;
                return Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () => setState(() => _numJugadores = n),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        gradient: sel ? const LinearGradient(colors: AppColors.gradienteHero) : null,
                        color: sel ? null : AppColors.fondoCard,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: sel ? AppColors.neonMorado : Colors.white12),
                      ),
                      child: Column(children: [
                        Text(List.generate(n, (i) => _avatares[i]).join(' '),
                          style: const TextStyle(fontSize: 20)),
                        const SizedBox(height: 8),
                        Text('$n jugadoras',
                          style: TextStyle(color: sel ? Colors.white : Colors.white60,
                            fontWeight: FontWeight.w700, fontSize: 13)),
                      ]),
                    ),
                  ),
                ));
              }).toList()),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.fondoCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text('📋 Cómo jugar:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  Text('• Pasa el celular entre jugadoras\n• Tira los dados y muévete en el tablero\n• Compra negocios y cobra renta\n• ¡La última jugadora sin quebrar gana!',
                    style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.6)),
                ]),
              ),
              const Spacer(),
              SizedBox(width: double.infinity, child: ElevatedButton(
                onPressed: () => _iniciarJuego(_numJugadores),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.neonMorado,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('♟️ INICIAR JUEGO',
                  style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w900)),
              )),
            ],
          ),
        ),
      ),
    );
  }

  // ── Pantalla de juego ─────────────────────────────────────────────
  Widget _buildJuego() {
    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: Column(children: [
          _buildHeader(),
          _buildTablero(),
          Expanded(child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(children: [
              _buildEspacioActual(),
              const SizedBox(height: 12),
              if (_cartaActiva != null) _buildCarta(),
              if (!_esperandoAccion) _buildBotonesTurno(),
              if (_esperandoAccion && _cartaActiva == null) _buildBotonesCompra(),
              const SizedBox(height: 12),
              _buildLog(),
            ]),
          )),
        ]),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF1A0A3C), Color(0xFF0D0E1A)]),
      ),
      child: Column(children: [
        Row(children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white54, size: 20),
            onPressed: () => showDialog(context: context, builder: (_) => AlertDialog(
              backgroundColor: AppColors.fondoCard,
              title: const Text('¿Salir del juego?', style: TextStyle(color: Colors.white)),
              content: const Text('Perderás el progreso de esta partida.',
                style: TextStyle(color: Colors.white70)),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); },
                  child: const Text('Salir', style: TextStyle(color: Colors.red))),
              ],
            )),
          ),
          const Expanded(child: Center(
            child: Text('♟️ MONOPOLIO LSF',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
          )),
          const SizedBox(width: 48),
        ]),
        const SizedBox(height: 8),
        SizedBox(
          height: 64,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _jugadores.length,
            itemBuilder: (_, i) {
              final j = _jugadores[i];
              final activo = i == _turnoIdx && !j.eliminado;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: activo ? j.color.withValues(alpha: 0.25) : Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: activo ? j.color : Colors.transparent, width: 2),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(j.emoji, style: const TextStyle(fontSize: 16)),
                    if (j.eliminado) const Text(' 💀', style: TextStyle(fontSize: 12)),
                    if (j.preso)    const Text(' 🔒', style: TextStyle(fontSize: 12)),
                  ]),
                  const SizedBox(height: 2),
                  Text('\$${j.dinero}',
                    style: TextStyle(
                      color: j.eliminado ? Colors.white30 : (activo ? Colors.white : Colors.white60),
                      fontSize: 13, fontWeight: FontWeight.w900)),
                ]),
              );
            },
          ),
        ),
      ]),
    );
  }

  Widget _buildTablero() {
    return Container(
      height: 72,
      color: const Color(0xFF0D0E1A),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: 20,
        itemBuilder: (_, i) {
          final esp = _tablero[i];
          final jugAqui = _jugadores.where((j) => j.pos == i && !j.eliminado).toList();
          final prop = _props[i];
          final esActual = _jugActual.pos == i;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 52,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: esActual
                ? _jugActual.color.withValues(alpha: 0.3)
                : (prop?.dueno != null && prop!.dueno >= 0)
                  ? _jugadores[prop.dueno].color.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: esActual
                  ? _jugActual.color
                  : esp.color ?? Colors.white12,
                width: esActual ? 2 : 1,
              ),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(esp.emoji, style: const TextStyle(fontSize: 16)),
              if (jugAqui.isNotEmpty)
                Text(jugAqui.map((j) => j.emoji).join(''), style: const TextStyle(fontSize: 8)),
              if (prop != null && prop.casas > 0)
                Text('🏠' * prop.casas, style: const TextStyle(fontSize: 7)),
            ]),
          );
        },
      ),
    );
  }

  Widget _buildEspacioActual() {
    final j   = _jugActual;
    final esp = _tablero[j.pos];
    final prop = _props[j.pos];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            (esp.color ?? AppColors.neonMorado).withValues(alpha: 0.25),
            AppColors.fondoCard,
          ],
          begin: Alignment.topLeft, end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: esp.color ?? AppColors.neonMorado.withValues(alpha: 0.3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text(esp.emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(esp.nombre,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
            if (esp.tipo == TEspacio.propiedad && prop != null) ...[
              const SizedBox(height: 2),
              Text('Precio: \$${esp.precio}  •  Renta: \$${prop.renta}',
                style: const TextStyle(color: Colors.white60, fontSize: 11)),
              if (prop.dueno >= 0)
                Text('Dueña: ${_jugadores[prop.dueno].emoji} ${_jugadores[prop.dueno].nombre}  •  Casas: ${prop.casas}/2',
                  style: const TextStyle(color: Colors.white60, fontSize: 11)),
            ],
          ])),
          Text(j.emoji, style: const TextStyle(fontSize: 22)),
        ]),
        if (j.esIA || j.eliminado) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(j.eliminado ? '💀 ${j.nombre} quebró' : '🤖 Turno de ${j.nombre} (IA)',
              style: const TextStyle(color: Colors.white54, fontSize: 12)),
          ),
        ],
      ]),
    );
  }

  Widget _buildCarta() {
    final c = _cartaActiva!;
    final positivo = c.$4 >= 0;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: positivo ? const Color(0xFF1B5E20) : const Color(0xFF7F0000),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: positivo ? const Color(0xFF4CAF50) : Colors.orange),
      ),
      child: Column(children: [
        Text(c.$1, style: const TextStyle(fontSize: 36)),
        const SizedBox(height: 6),
        Text(c.$2, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
        const SizedBox(height: 4),
        Text(c.$3, style: const TextStyle(color: Colors.white70, fontSize: 13), textAlign: TextAlign.center),
        const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: _accionPasar,
          style: ElevatedButton.styleFrom(
            backgroundColor: positivo ? const Color(0xFF4CAF50) : Colors.orange,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text('Entendido ✓', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        )),
      ]),
    );
  }

  Widget _buildBotonesTurno() {
    final j = _jugActual;
    if (j.esIA || j.eliminado) return const SizedBox.shrink();
    final prop = _props[j.pos];
    final puedeConstituir = prop != null && prop.dueno == j.id && !prop.maxCasas && j.dinero >= prop.costoCasa;
    return Column(children: [
      SizedBox(width: double.infinity, child: ElevatedButton(
        onPressed: _tiro ? null : _tirarDados,
        style: ElevatedButton.styleFrom(
          backgroundColor: _tiro ? Colors.white12 : AppColors.neonMorado,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: _tiro
          ? const Text('⏳ Procesando...', style: TextStyle(color: Colors.white54))
          : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('🎲 TIRAR DADOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
              if (_d1 > 0) Text('  $_d1 + $_d2 = ${_d1+_d2}',
                style: const TextStyle(color: Colors.white70, fontSize: 14)),
            ]),
      )),
      if (puedeConstituir) ...[
        const SizedBox(height: 8),
        SizedBox(width: double.infinity, child: OutlinedButton(
          onPressed: _accionConstruir,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF4CAF50)),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          child: Text('🏠 Construir casa (\$${prop.costoCasa})',
            style: const TextStyle(color: Color(0xFF4CAF50), fontWeight: FontWeight.w700)),
        )),
      ],
    ]);
  }

  Widget _buildBotonesCompra() {
    final j = _jugActual;
    if (j.esIA) return const SizedBox.shrink();
    final esp = _tablero[j.pos];
    if (esp.tipo != TEspacio.propiedad) return const SizedBox.shrink();
    final prop = _props[j.pos]!;
    if (prop.dueno != -1) return const SizedBox.shrink();
    final puedePagar = j.dinero >= esp.precio;
    return Row(children: [
      Expanded(child: ElevatedButton(
        onPressed: puedePagar ? _accionComprar : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: puedePagar ? const Color(0xFF4CAF50) : Colors.white12,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: Text('✅ Comprar \$${esp.precio}',
          style: TextStyle(color: puedePagar ? Colors.white : Colors.white30, fontWeight: FontWeight.w900)),
      )),
      const SizedBox(width: 10),
      Expanded(child: OutlinedButton(
        onPressed: _accionPasar,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white24),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: const Text('Pasar', style: TextStyle(color: Colors.white60)),
      )),
    ]);
  }

  Widget _buildLog() {
    if (_log.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.fondoCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('📋 Últimas jugadas', style: TextStyle(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        ..._log.take(5).map((l) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(l, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        )),
      ]),
    );
  }

  // ── Resultados ────────────────────────────────────────────────────
  Widget _buildResultados() {
    final activos = _jugadores.where((j) => !j.eliminado).toList();
    final ganador = activos.isNotEmpty ? activos.first
      : _jugadores.reduce((a, b) => a.dinero >= b.dinero ? a : b);
    final ranking = [..._jugadores]..sort((a, b) => b.dinero.compareTo(a.dinero));
    final podium = ['🥇', '🥈', '🥉'];

    return Scaffold(
      backgroundColor: AppColors.fondoOscuro,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(children: [
            const SizedBox(height: 24),
            Text(ganador.emoji, style: const TextStyle(fontSize: 80)),
            const SizedBox(height: 12),
            Text('¡${ganador.nombre} ganó!',
              style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900)),
            const Text('La mejor empresaria del tablero',
              style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 32),
            ...List.generate(ranking.length, (i) {
              final j = ranking[i];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: i == 0
                    ? const Color(0xFFFFD700).withValues(alpha: 0.2)
                    : AppColors.fondoCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: i == 0 ? const Color(0xFFFFD700) : Colors.white10),
                ),
                child: Row(children: [
                  Text(i < 3 ? podium[i] : '  ', style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Text(j.emoji, style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(child: Text(j.nombre,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                  Text('\$${j.dinero}',
                    style: TextStyle(
                      color: i == 0 ? const Color(0xFFFFD700) : Colors.white60,
                      fontWeight: FontWeight.w900, fontSize: 16)),
                ]),
              );
            }),
            const SizedBox(height: 32),
            SizedBox(width: double.infinity, child: ElevatedButton(
              onPressed: () => setState(() {
                _juegoIniciado = false;
                _terminado = false;
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.neonMorado,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('🔄 JUGAR DE NUEVO',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16)),
            )),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('← Volver a Academia', style: TextStyle(color: Colors.white54)),
            ),
          ]),
        ),
      ),
    );
  }
}
