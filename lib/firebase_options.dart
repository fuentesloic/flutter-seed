// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAraz5MMnbfXZjnLZZYKdtSeFnXkpCimMA',
    appId: '1:452851796801:web:08430ecafc0f86653defc0',
    messagingSenderId: '452851796801',
    projectId: 'flutter-template-firabase',
    authDomain: 'flutter-template-firabase.firebaseapp.com',
    storageBucket: 'flutter-template-firabase.appspot.com',
    measurementId: 'G-3W9DW2KL0F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHMUvhU0U_T6wj_sFadyF9eYlMviiootE',
    appId: '1:452851796801:android:ab3d165d33268d5c3defc0',
    messagingSenderId: '452851796801',
    projectId: 'flutter-template-firabase',
    storageBucket: 'flutter-template-firabase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCHXNHBjfUoLrVbIe6KxD9Pszm9gm9ALg',
    appId: '1:452851796801:ios:e918953448c9acec3defc0',
    messagingSenderId: '452851796801',
    projectId: 'flutter-template-firabase',
    storageBucket: 'flutter-template-firabase.appspot.com',
    iosClientId: '452851796801-cdobgr05im8rg3lf0j4ed55gi6pu0q90.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterSeed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCHXNHBjfUoLrVbIe6KxD9Pszm9gm9ALg',
    appId: '1:452851796801:ios:e918953448c9acec3defc0',
    messagingSenderId: '452851796801',
    projectId: 'flutter-template-firabase',
    storageBucket: 'flutter-template-firabase.appspot.com',
    iosClientId: '452851796801-cdobgr05im8rg3lf0j4ed55gi6pu0q90.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterSeed',
  );
}
