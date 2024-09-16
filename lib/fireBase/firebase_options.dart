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
    apiKey: 'AIzaSyCXovoCH_RxQXkW5V3fziuEzRdd_xRZQd4',
    appId: '1:890067248661:web:a2d0b36f72e6eaf39dd01c',
    messagingSenderId: '890067248661',
    projectId: 'todoappp-ec148',
    authDomain: 'todoappp-ec148.firebaseapp.com',
    storageBucket: 'todoappp-ec148.appspot.com',
    measurementId: 'G-P7KJYHQKY2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_DdLZPNcz8YEFabWmZ0TqQlOvsuwg1Ds',
    appId: '1:890067248661:android:f3a093ef481f5ad29dd01c',
    messagingSenderId: '890067248661',
    projectId: 'todoappp-ec148',
    storageBucket: 'todoappp-ec148.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqBCuB5fe_kvScfju1UJRyxT83XGzo0tY',
    appId: '1:890067248661:ios:1e79cc1cefe518899dd01c',
    messagingSenderId: '890067248661',
    projectId: 'todoappp-ec148',
    storageBucket: 'todoappp-ec148.appspot.com',
    iosBundleId: 'com.example.toDoAppp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAqBCuB5fe_kvScfju1UJRyxT83XGzo0tY',
    appId: '1:890067248661:ios:1e79cc1cefe518899dd01c',
    messagingSenderId: '890067248661',
    projectId: 'todoappp-ec148',
    storageBucket: 'todoappp-ec148.appspot.com',
    iosBundleId: 'com.example.toDoAppp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCXovoCH_RxQXkW5V3fziuEzRdd_xRZQd4',
    appId: '1:890067248661:web:78a9ff0ec4a6d71f9dd01c',
    messagingSenderId: '890067248661',
    projectId: 'todoappp-ec148',
    authDomain: 'todoappp-ec148.firebaseapp.com',
    storageBucket: 'todoappp-ec148.appspot.com',
    measurementId: 'G-SQ0PYQPZXS',
  );

}