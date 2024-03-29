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
    apiKey: 'AIzaSyDG4V_M81MKkHNd2G0Povk6DUcAIu3vUhg',
    appId: '1:941174927282:web:88dd3fdc9dcd7c14f1feab',
    messagingSenderId: '941174927282',
    projectId: 'carrent-e5d67',
    authDomain: 'carrent-e5d67.firebaseapp.com',
    storageBucket: 'carrent-e5d67.appspot.com',
    measurementId: 'G-EL1ETJDPHF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbDIvn_e8CPsxGAehnJPboPH6yoXfpJsM',
    appId: '1:941174927282:android:e1554380273a9605f1feab',
    messagingSenderId: '941174927282',
    projectId: 'carrent-e5d67',
    storageBucket: 'carrent-e5d67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvziSMMrXA_YstlzMWmQxgJ8-JfF34ylk',
    appId: '1:941174927282:ios:fe83de5e6cb9a71df1feab',
    messagingSenderId: '941174927282',
    projectId: 'carrent-e5d67',
    storageBucket: 'carrent-e5d67.appspot.com',
    iosClientId: '941174927282-1iqs9q1nejnarbfm7sdnufq8omgp3bh5.apps.googleusercontent.com',
    iosBundleId: 'com.example.carRent',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvziSMMrXA_YstlzMWmQxgJ8-JfF34ylk',
    appId: '1:941174927282:ios:fe83de5e6cb9a71df1feab',
    messagingSenderId: '941174927282',
    projectId: 'carrent-e5d67',
    storageBucket: 'carrent-e5d67.appspot.com',
    iosClientId: '941174927282-1iqs9q1nejnarbfm7sdnufq8omgp3bh5.apps.googleusercontent.com',
    iosBundleId: 'com.example.carRent',
  );
}
