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
    apiKey: 'AIzaSyCS-EjQjxgaW_q5Q5b5ZespdPvUMmUAdHQ',
    appId: '1:23877398782:web:3041d4f1bcf5bf256235af',
    messagingSenderId: '23877398782',
    projectId: 'myflutter-firebaseproject',
    authDomain: 'myflutter-firebaseproject.firebaseapp.com',
    storageBucket: 'myflutter-firebaseproject.appspot.com',
    measurementId: 'G-R2R6TR4D6B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNYvOBCwdoMJJWUwWtMClCvgie08fkR9g',
    appId: '1:23877398782:android:3b034a4dfc13699c6235af',
    messagingSenderId: '23877398782',
    projectId: 'myflutter-firebaseproject',
    storageBucket: 'myflutter-firebaseproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiXcPm_BVwYGqdVLm-XWcNSBrhP-UwZlI',
    appId: '1:23877398782:ios:098f968964b1da036235af',
    messagingSenderId: '23877398782',
    projectId: 'myflutter-firebaseproject',
    storageBucket: 'myflutter-firebaseproject.appspot.com',
    iosBundleId: 'com.example.learningdart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiXcPm_BVwYGqdVLm-XWcNSBrhP-UwZlI',
    appId: '1:23877398782:ios:ba4e7a3fe642405a6235af',
    messagingSenderId: '23877398782',
    projectId: 'myflutter-firebaseproject',
    storageBucket: 'myflutter-firebaseproject.appspot.com',
    iosBundleId: 'com.example.learningdart.RunnerTests',
  );
}
