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
    apiKey: 'AIzaSyCFl6cQj_1B-EjI0y6LsHqlQMdAVTdvxAo',
    appId: '1:379866792144:web:10c508dfd93e9c5c72ded5',
    messagingSenderId: '379866792144',
    projectId: 'recipe-app-d4732',
    authDomain: 'recipe-app-d4732.firebaseapp.com',
    storageBucket: 'recipe-app-d4732.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgXXWiZHKzRT7yVDgWY8QgESpAstg_7hY',
    appId: '1:379866792144:android:00ddab5cba1a974172ded5',
    messagingSenderId: '379866792144',
    projectId: 'recipe-app-d4732',
    storageBucket: 'recipe-app-d4732.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzxwDp6QpSCTazO35nQfX8jjA4zhIjLO8',
    appId: '1:379866792144:ios:c38b2ff81a73af5c72ded5',
    messagingSenderId: '379866792144',
    projectId: 'recipe-app-d4732',
    storageBucket: 'recipe-app-d4732.firebasestorage.app',
    iosBundleId: 'com.example.recipesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzxwDp6QpSCTazO35nQfX8jjA4zhIjLO8',
    appId: '1:379866792144:ios:c38b2ff81a73af5c72ded5',
    messagingSenderId: '379866792144',
    projectId: 'recipe-app-d4732',
    storageBucket: 'recipe-app-d4732.firebasestorage.app',
    iosBundleId: 'com.example.recipesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCFl6cQj_1B-EjI0y6LsHqlQMdAVTdvxAo',
    appId: '1:379866792144:web:bf450c886d326ace72ded5',
    messagingSenderId: '379866792144',
    projectId: 'recipe-app-d4732',
    authDomain: 'recipe-app-d4732.firebaseapp.com',
    storageBucket: 'recipe-app-d4732.firebasestorage.app',
  );
}
