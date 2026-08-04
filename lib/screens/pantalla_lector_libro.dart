// lib/screens/pantalla_lector_libro.dart
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/libro_model.dart';
import '../theme.dart';

class PantallaLectorLibro extends StatefulWidget {
  final Libro libro;
  final int capituloInicial;

  const PantallaLectorLibro({
    super.key,
    required this.libro,
    this.capituloInicial = 0,
  });

  @override
  State<PantallaLectorLibro> createState() => _PantallaLectorLibroState();
}

class _PantallaLectorLibroState extends State<PantallaLectorLibro> {
  late int _capituloActual;
  final ScrollController _scrollController = ScrollController();

  // ── TTS ───────────────────────────────────
  final FlutterTts _tts = FlutterTts();
  bool _ttsActivo  = false;
  bool _ttsPausado = false;
  int  _parrafoActual = -1;
  double _velocidad = 0.5;
  List<String> _parrafos = [];
  final List<GlobalKey> _parrafoKeys = [];

  @override
  void initState() {
    super.initState();
    _capituloActual = widget.capituloInicial;
    _parsearParrafos();
    _initTts();
  }

  @override
  void dispose() {
    _tts.stop();
    _scrollController.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────────
  //  TTS SETUP
  // ─────────────────────────────────────────────
  Future<void> _initTts() async {
    await _tts.setLanguage('es-MX');
    await _tts.setSpeechRate(_velocidad);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);

    _tts.setCompletionHandler(() async {
      if (!mounted) return;
      if (_parrafoActual < _parrafos.length - 1) {
        setState(() => _parrafoActual++);
        await _leerParrafoActual();
      } else {
        // Terminó el capítulo
        setState(() {
          _ttsActivo   = false;
          _ttsPausado  = false;
          _parrafoActual = -1;
        });
      }
    });

    _tts.setErrorHandler((_) {
      if (!mounted) return;
      setState(() { _ttsActivo = false; _ttsPausado = false; _parrafoActual = -1; });
    });
  }

  void _parsearParrafos() {
    _parrafos = widget.libro.capitulos[_capituloActual].contenido
        .split('\n\n')
        .where((p) => p.trim().isNotEmpty)
        .map((p) => p.trim())
        .toList();
    _parrafoKeys.clear();
    for (var i = 0; i < _parrafos.length; i++) {
      _parrafoKeys.add(GlobalKey());
    }
  }

  Future<void> _iniciarLectura() async {
    await _tts.stop();
    setState(() { _ttsActivo = true; _ttsPausado = false; _parrafoActual = 0; });
    await _leerParrafoActual();
  }

  Future<void> _pausarReanudar() async {
    if (_ttsPausado) {
      // Reanudar — re-lee el párrafo actual
      setState(() => _ttsPausado = false);
      await _leerParrafoActual();
    } else {
      // Pausar
      if (kIsWeb) {
        // En web, stop y guardar posición
        await _tts.stop();
      } else {
        await _tts.pause();
      }
      if (mounted) setState(() => _ttsPausado = true);
    }
  }

  Future<void> _detener() async {
    await _tts.stop();
    if (mounted) setState(() { _ttsActivo = false; _ttsPausado = false; _parrafoActual = -1; });
  }

  Future<void> _leerParrafoActual() async {
    if (_parrafoActual < 0 || _parrafoActual >= _parrafos.length) return;
    _scrollAlParrafo(_parrafoActual);
    await _tts.speak(_parrafos[_parrafoActual]);
  }

  void _scrollAlParrafo(int idx) {
    if (idx < 0 || idx >= _parrafoKeys.length) return;
    final ctx = _parrafoKeys[idx].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
        alignment: 0.15,
      );
    }
  }

  Future<void> _ciclarVelocidad() async {
    final opciones = [0.3, 0.5, 0.7];
    final sigIdx = (opciones.indexOf(_velocidad) + 1) % opciones.length;
    setState(() => _velocidad = opciones[sigIdx]);
    await _tts.setSpeechRate(_velocidad);
    // Si está sonando, reiniciar párrafo con nueva velocidad
    if (_ttsActivo && !_ttsPausado) {
      await _tts.stop();
      await _leerParrafoActual();
    }
  }

  String get _labelVelocidad {
    if (_velocidad <= 0.3) return '🐢 Lento';
    if (_velocidad <= 0.5) return '📖 Normal';
    return '🚀 Rápido';
  }

  // ─────────────────────────────────────────────
  //  CAPÍTULO NAV
  // ─────────────────────────────────────────────
  CapituloResumen get _capitulo => widget.libro.capitulos[_capituloActual];
  bool get _esUltimo  => _capituloActual == widget.libro.capitulos.length - 1;
  bool get _esPrimero => _capituloActual == 0;

  Future<void> _cambiarCapitulo(int nuevo) async {
    await _detener();
    setState(() {
      _capituloActual = nuevo;
      _parsearParrafos();
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  Future<void> _marcarYAvanzar(AppProvider app) async {
    await _detener();
    await app.marcarCapituloLeido(widget.libro.id, _capituloActual);
    if (_esUltimo) {
      if (mounted) Navigator.pop(context);
    } else {
      await _cambiarCapitulo(_capituloActual + 1);
    }
  }

  // ─────────────────────────────────────────────
  //  BUILD
  // ─────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, _) {
        final capitulosLeidos = app.capitulosLeidos(widget.libro.id);
        final esteLeido = capitulosLeidos.contains(_capituloActual);

        return Scaffold(
          backgroundColor: const Color(0xFF080910),
          body: SafeArea(
            child: Column(
              children: [
                _buildTopBar(context, app.capitulosLeidos(widget.libro.id)),
                _buildAudioBar(),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildChapterHeader(),
                        const SizedBox(height: 24),
                        _buildContenido(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
                _buildBottomBar(app, esteLeido),
              ],
            ),
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────────
  //  TOP BAR
  // ─────────────────────────────────────────────
  Widget _buildTopBar(BuildContext context, Set<int> capitulosLeidos) {
    final total = widget.libro.capitulos.length;
    final progreso = (_capituloActual + 1) / total;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.fondoCard,
        border: Border(bottom: BorderSide(color: Color(0xFF252840))),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await _detener();
                  if (!mounted) return;
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close, color: AppColors.textoGris, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.libro.titulo,
                  style: const TextStyle(color: AppColors.textoBlanco, fontWeight: FontWeight.w700, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('${_capituloActual + 1}/$total',
                  style: const TextStyle(color: AppColors.textoGris, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: progreso,
              backgroundColor: AppColors.fondoCardClaro,
              valueColor: const AlwaysStoppedAnimation(AppColors.neonMorado),
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  AUDIO BAR
  // ─────────────────────────────────────────────
  Widget _buildAudioBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: _ttsActivo
            ? AppColors.neonMorado.withValues(alpha: 0.15)
            : AppColors.fondoCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: _ttsActivo
              ? AppColors.neonMorado.withValues(alpha: 0.5)
              : const Color(0xFF252840),
        ),
      ),
      child: Row(
        children: [
          // Ícono de audio
          Text(
            _ttsActivo && !_ttsPausado ? '🔊' : '🔈',
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(width: 10),

          // Estado y párrafo actual
          Expanded(
            child: Text(
              _ttsActivo
                  ? _ttsPausado
                      ? 'Pausado en párrafo ${_parrafoActual + 1}'
                      : 'Leyendo párrafo ${_parrafoActual + 1} de ${_parrafos.length}...'
                  : 'Toca ▶ para escuchar este capítulo',
              style: TextStyle(
                color: _ttsActivo ? AppColors.neonMorado : AppColors.textoGris,
                fontSize: 12,
                fontWeight: _ttsActivo ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),

          // Velocidad
          GestureDetector(
            onTap: _ciclarVelocidad,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.fondoCardClaro,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _labelVelocidad,
                style: const TextStyle(color: AppColors.textoGris, fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Play / Pausa
          GestureDetector(
            onTap: _ttsActivo ? _pausarReanudar : _iniciarLectura,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: AppColors.gradienteHero),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: AppColors.neonMorado.withValues(alpha: 0.4), blurRadius: 8)],
              ),
              child: Icon(
                _ttsActivo && !_ttsPausado ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),

          // Stop (solo cuando activo)
          if (_ttsActivo) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _detener,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.fondoCardClaro,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.stop_rounded, color: AppColors.textoGris, size: 18),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  CHAPTER HEADER
  // ─────────────────────────────────────────────
  Widget _buildChapterHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: AppColors.gradienteHero),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('Capítulo ${_capituloActual + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
            ),
            const SizedBox(width: 8),
            Text(_capitulo.emoji, style: const TextStyle(fontSize: 20)),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          _capitulo.titulo,
          style: const TextStyle(
            color: AppColors.textoBlanco,
            fontSize: 22,
            fontWeight: FontWeight.w900,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 6),
        const Text('≈ 10 páginas del libro · Resumen', style: AppTextStyles.caption),
        const SizedBox(height: 16),
        const Divider(color: Color(0xFF252840)),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  CONTENIDO CON RESALTADO
  // ─────────────────────────────────────────────
  Widget _buildContenido() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(_parrafos.length, (i) {
        final texto = _parrafos[i];
        final esTitulo = texto == texto.toUpperCase() && texto.length < 80 && !texto.contains('.');
        final esActual  = i == _parrafoActual;
        final esLeido   = _parrafoActual > i;

        return AnimatedContainer(
          key: _parrafoKeys[i],
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(bottom: 18),
          padding: esActual
              ? const EdgeInsets.symmetric(horizontal: 14, vertical: 10)
              : EdgeInsets.zero,
          decoration: esActual
              ? BoxDecoration(
                  color: AppColors.neonMorado.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.neonMorado.withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                )
              : null,
          child: esTitulo
              ? Text(
                  texto,
                  style: TextStyle(
                    color: esActual ? AppColors.neonMorado : AppColors.neonMorado.withValues(alpha: 0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                  ),
                )
              : Text(
                  texto,
                  style: TextStyle(
                    color: esActual
                        ? AppColors.textoBlanco
                        : esLeido
                            ? const Color(0xFF6B7094)
                            : const Color(0xFFCDD0E3),
                    fontSize: 16,
                    height: 1.8,
                    fontWeight: esActual ? FontWeight.w500 : FontWeight.w400,
                  ),
                ),
        );
      }),
    );
  }

  // ─────────────────────────────────────────────
  //  BOTTOM BAR
  // ─────────────────────────────────────────────
  Widget _buildBottomBar(AppProvider app, bool esteLeido) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: const BoxDecoration(
        color: AppColors.fondoCard,
        border: Border(top: BorderSide(color: Color(0xFF252840))),
      ),
      child: Row(
        children: [
          // Anterior
          if (!_esPrimero)
            GestureDetector(
              onTap: () => _cambiarCapitulo(_capituloActual - 1),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.fondoCardClaro,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios, size: 14, color: AppColors.textoGris),
                    SizedBox(width: 4),
                    Text('Anterior', style: TextStyle(color: AppColors.textoGris, fontSize: 13)),
                  ],
                ),
              ),
            ),
          if (!_esPrimero) const SizedBox(width: 10),

          // Marcar / Siguiente
          Expanded(
            child: GestureDetector(
              onTap: esteLeido
                  ? (_esUltimo
                      ? null
                      : () => _cambiarCapitulo(_capituloActual + 1))
                  : () => _marcarYAvanzar(app),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: esteLeido
                        ? [AppColors.fondoCardClaro, AppColors.fondoCardClaro]
                        : AppColors.gradienteHero,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    esteLeido
                        ? (_esUltimo ? '✅ Todos los capítulos leídos' : 'Siguiente →')
                        : (_esUltimo
                            ? '✓ Marcar como leído'
                            : '✓ Marcar leído y continuar →'),
                    style: TextStyle(
                      color: esteLeido ? AppColors.textoGris : Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
