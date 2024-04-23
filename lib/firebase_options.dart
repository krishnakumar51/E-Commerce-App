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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAJ6jtSQFaQw4c20mxPYghEv1IwvQluqSg',
    appId: '1:314500486047:web:746e162ae85264cc33a3aa',
    messagingSenderId: '314500486047',
    projectId: 'e-commerce-app-a08d5',
    authDomain: 'e-commerce-app-a08d5.firebaseapp.com',
    storageBucket: 'e-commerce-app-a08d5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHGjWPjGcj3DLcIRvzgvKlh_CI5FADUy8',
    appId: '1:314500486047:android:24863fb28b8f52b533a3aa',
    messagingSenderId: '314500486047',
    projectId: 'e-commerce-app-a08d5',
    storageBucket: 'e-commerce-app-a08d5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHbNCNtVQK6kPCqFakKefCJWshG6Wjw1g',
    appId: '1:314500486047:ios:0f0032db25bf29ae33a3aa',
    messagingSenderId: '314500486047',
    projectId: 'e-commerce-app-a08d5',
    storageBucket: 'e-commerce-app-a08d5.appspot.com',
    androidClientId: '314500486047-nsa3g7udoapf5tptlikqsgascjicp85j.apps.googleusercontent.com',
    iosClientId: '314500486047-1pngmv89gsmkn3msdj464b7jfcu61td8.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommmerceApp',
  );

}