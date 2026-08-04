// lib/utils/sound_player.dart
// Genera y reproduce tonos WAV en memoria -- sin archivos de asset.
import 'dart:math';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';

class SoundPlayer {
  SoundPlayer._();

  static final _pool = <_SoundId, AudioPlayer>{};

  // ── Sonidos existentes ──────────────────────────────────────
  static Future<void> correcto() => _play(_SoundId.correcto);
  static Future<void> error()    => _play(_SoundId.error);
  static Future<void> venta()    => _play(_SoundId.venta);
  static Future<void> leccion()  => _play(_SoundId.leccion);
  static Future<void> mision()   => _play(_SoundId.mision);

  // ── Sonidos nuevos ──────────────────────────────────────────
  static Future<void> compra()   => _play(_SoundId.compra);
  static Future<void> nivel()    => _play(_SoundId.nivel);
  static Future<void> victoria() => _play(_SoundId.victoria);
  static Future<void> dado()     => _play(_SoundId.dado);
  static Future<void> payday()   => _play(_SoundId.payday);
  static Future<void> pasivo()   => _play(_SoundId.pasivo);
  static Future<void> click()    => _play(_SoundId.click);
  static Future<void> tiempo()   => _play(_SoundId.tiempo);

  static Future<void> _play(_SoundId id) async {
    try {
      final player = _pool.putIfAbsent(id, () => AudioPlayer());
      await player.stop();
      await player.play(BytesSource(_wavs[id]!));
    } catch (_) {}
  }

  static final Map<_SoundId, Uint8List> _wavs = {
    // ── Existentes ─────────────────────────────────────────────
    _SoundId.correcto: _generarMelodia(
      frecuencias: [523.25, 659.25, 783.99],
      duraciones:  [0.09,   0.09,   0.18],
      volumen: 0.55,
    ),
    _SoundId.error: _generarMelodia(
      frecuencias: [311.13, 233.08],
      duraciones:  [0.12,   0.25],
      volumen: 0.45,
    ),
    _SoundId.venta: _generarMelodia(
      frecuencias: [659.25, 783.99, 1046.50],
      duraciones:  [0.06,   0.06,   0.18],
      volumen: 0.6,
    ),
    _SoundId.leccion: _generarMelodia(
      frecuencias: [523.25, 659.25, 783.99, 1046.50],
      duraciones:  [0.08,   0.08,   0.08,   0.28],
      volumen: 0.6,
    ),
    _SoundId.mision: _generarMelodia(
      frecuencias: [659.25, 783.99, 987.77, 1318.51],
      duraciones:  [0.07,   0.07,   0.07,   0.30],
      volumen: 0.55,
    ),

    // ── Compra: "cha-ching" — golpe corto + subida ─────────────
    _SoundId.compra: _generarMelodia(
      frecuencias: [880.00, 1108.73, 1318.51],
      duraciones:  [0.05,   0.05,    0.14],
      volumen: 0.65,
    ),

    // ── Nivel: fanfarria ascendente 5 notas ───────────────────
    _SoundId.nivel: _generarMelodia(
      frecuencias: [523.25, 659.25, 783.99, 1046.50, 1318.51],
      duraciones:  [0.08,   0.08,   0.08,   0.08,    0.35],
      volumen: 0.70,
    ),

    // ── Victoria: melodía triunfal 7 notas ───────────────────
    _SoundId.victoria: _generarMelodia(
      frecuencias: [523.25, 659.25, 783.99, 659.25, 783.99, 1046.50, 1318.51],
      duraciones:  [0.10,   0.10,   0.10,   0.08,   0.08,   0.10,    0.45],
      volumen: 0.75,
    ),

    // ── Dado: ruido rápido descendente (3 pulsos) ────────────
    _SoundId.dado: _generarMelodia(
      frecuencias: [392.00, 329.63, 261.63],
      duraciones:  [0.06,   0.06,   0.10],
      volumen: 0.50,
    ),

    // ── Payday: alegre ascendente-descendente ─────────────────
    _SoundId.payday: _generarMelodia(
      frecuencias: [659.25, 783.99, 1046.50, 783.99, 1046.50],
      duraciones:  [0.07,   0.07,   0.07,    0.07,   0.28],
      volumen: 0.65,
    ),

    // ── Pasivo: tono grave de "gasto" ───────────────────────
    _SoundId.pasivo: _generarMelodia(
      frecuencias: [261.63, 220.00, 174.61],
      duraciones:  [0.10,   0.10,   0.28],
      volumen: 0.40,
    ),

    // ── Click: toque rápido de UI ────────────────────────────
    _SoundId.click: _generarMelodia(
      frecuencias: [1046.50],
      duraciones:  [0.04],
      volumen: 0.30,
    ),

    // ── Tiempo: beep urgente (doble) ─────────────────────────
    _SoundId.tiempo: _generarMelodia(
      frecuencias: [880.00, 880.00],
      duraciones:  [0.07,   0.07],
      volumen: 0.50,
    ),
  };

  static Uint8List _generarMelodia({
    required List<double> frecuencias,
    required List<double> duraciones,
    double volumen = 0.5,
    double sampleRate = 22050,
  }) {
    assert(frecuencias.length == duraciones.length);

    final totalSamples = duraciones.fold<int>(
      0, (s, d) => s + (sampleRate * d).round(),
    );

    final pcm = Int16List(totalSamples);
    int offset = 0;

    for (int seg = 0; seg < frecuencias.length; seg++) {
      final freq = frecuencias[seg];
      final n = (sampleRate * duraciones[seg]).round();
      final fadeLen = min(n ~/ 8, 80);

      for (int i = 0; i < n; i++) {
        double env = 1.0;
        if (i < fadeLen) env = i / fadeLen;
        if (i > n - fadeLen) env = (n - i) / fadeLen;

        final sample = (32767 * volumen * env * sin(2 * pi * freq * i / sampleRate))
            .round()
            .clamp(-32768, 32767);
        pcm[offset + i] = sample;
      }
      offset += n;
    }

    final wav = ByteData(44 + totalSamples * 2);

    void setStr(int off, String s) {
      for (int i = 0; i < s.length; i++) {
        wav.setUint8(off + i, s.codeUnitAt(i));
      }
    }

    setStr(0, 'RIFF');
    wav.setUint32(4,  36 + totalSamples * 2, Endian.little);
    setStr(8, 'WAVE');
    setStr(12, 'fmt ');
    wav.setUint32(16, 16, Endian.little);
    wav.setUint16(20, 1,  Endian.little);
    wav.setUint16(22, 1,  Endian.little);
    wav.setUint32(24, sampleRate.round(), Endian.little);
    wav.setUint32(28, sampleRate.round() * 2, Endian.little);
    wav.setUint16(32, 2,  Endian.little);
    wav.setUint16(34, 16, Endian.little);
    setStr(36, 'data');
    wav.setUint32(40, totalSamples * 2, Endian.little);

    for (int i = 0; i < totalSamples; i++) {
      wav.setInt16(44 + i * 2, pcm[i], Endian.little);
    }

    return wav.buffer.asUint8List();
  }

  static void dispose() {
    for (final p in _pool.values) p.dispose();
    _pool.clear();
  }
}

enum _SoundId { correcto, error, venta, leccion, mision, compra, nivel, victoria, dado, payday, pasivo, click, tiempo }
