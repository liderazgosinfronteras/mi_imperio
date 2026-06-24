// lib/firebase_options.dart — Configuración real de Firebase
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey:            'AIzaSyBHIr-ZdqNUiiQ7DE5ZqCY7nTH29gbRRCA',
    appId:             '1:764486308183:web:0962995d7927adb5b4ae12',
    messagingSenderId: '764486308183',
    projectId:         'mi-imperio-lsf',
    authDomain:        'mi-imperio-lsf.firebaseapp.com',
    storageBucket:     'mi-imperio-lsf.firebasestorage.app',
    measurementId:     'G-PS8L5WKRG1',
  );

  // Para Android — usa los mismos valores web por ahora
  // (para producción, descarga google-services.json y genera opciones nativas)
  static const FirebaseOptions android = FirebaseOptions(
    apiKey:            'AIzaSyBHIr-ZdqNUiiQ7DE5ZqCY7nTH29gbRRCA',
    appId:             '1:764486308183:web:0962995d7927adb5b4ae12',
    messagingSenderId: '764486308183',
    projectId:         'mi-imperio-lsf',
    storageBucket:     'mi-imperio-lsf.firebasestorage.app',
  );
}
