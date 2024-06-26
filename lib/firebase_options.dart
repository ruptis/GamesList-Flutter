// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAmOZFyluTDvDaeEK7kwBZMLp4L0gMiNUU',
    appId: '1:707789875606:web:fe5232abe2e2627f2755b7',
    messagingSenderId: '707789875606',
    projectId: 'games-list-1967f',
    authDomain: 'games-list-1967f.firebaseapp.com',
    storageBucket: 'games-list-1967f.appspot.com',
    measurementId: 'G-EWCNC50DMY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCseUxyff7OO5UGTY4VCyYhDT5-SOujvH4',
    appId: '1:707789875606:android:31cbfa58e5ed78282755b7',
    messagingSenderId: '707789875606',
    projectId: 'games-list-1967f',
    storageBucket: 'games-list-1967f.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAmOZFyluTDvDaeEK7kwBZMLp4L0gMiNUU',
    appId: '1:707789875606:web:54a1a9ae8b7df9af2755b7',
    messagingSenderId: '707789875606',
    projectId: 'games-list-1967f',
    authDomain: 'games-list-1967f.firebaseapp.com',
    storageBucket: 'games-list-1967f.appspot.com',
    measurementId: 'G-M27235SMJF',
  );
}
