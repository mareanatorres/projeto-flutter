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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyCHISwi65ihxEMsjwGt4_9_oOpE8CJfej0',
    appId: '1:130303227201:web:12d23554befd9a9a481dc0',
    messagingSenderId: '130303227201',
    projectId: 'projetoacqa',
    authDomain: 'projetoacqa.firebaseapp.com',
    databaseURL: 'https://projetoacqa-default-rtdb.firebaseio.com',
    storageBucket: 'projetoacqa.firebasestorage.app',
    measurementId: 'G-8W66NXQY6H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANFmroqKzNs-FrW0-VuR9VpJkQT1GK6ZY',
    appId: '1:130303227201:android:987618b1ea8ba357481dc0',
    messagingSenderId: '130303227201',
    projectId: 'projetoacqa',
    databaseURL: 'https://projetoacqa-default-rtdb.firebaseio.com',
    storageBucket: 'projetoacqa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsB8e6A9GHAebPoXe-LhufOV1RgjNq8tE',
    appId: '1:130303227201:ios:cddbf26c6d296cb0481dc0',
    messagingSenderId: '130303227201',
    projectId: 'projetoacqa',
    databaseURL: 'https://projetoacqa-default-rtdb.firebaseio.com',
    storageBucket: 'projetoacqa.firebasestorage.app',
    iosBundleId: 'com.example.projetoacqa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsB8e6A9GHAebPoXe-LhufOV1RgjNq8tE',
    appId: '1:130303227201:ios:cddbf26c6d296cb0481dc0',
    messagingSenderId: '130303227201',
    projectId: 'projetoacqa',
    databaseURL: 'https://projetoacqa-default-rtdb.firebaseio.com',
    storageBucket: 'projetoacqa.firebasestorage.app',
    iosBundleId: 'com.example.projetoacqa',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCHISwi65ihxEMsjwGt4_9_oOpE8CJfej0',
    appId: '1:130303227201:web:487e17245d62cb5b481dc0',
    messagingSenderId: '130303227201',
    projectId: 'projetoacqa',
    authDomain: 'projetoacqa.firebaseapp.com',
    databaseURL: 'https://projetoacqa-default-rtdb.firebaseio.com',
    storageBucket: 'projetoacqa.firebasestorage.app',
    measurementId: 'G-81S9KBY0FY',
  );
}
