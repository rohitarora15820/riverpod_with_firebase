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
    apiKey: 'AIzaSyBhwQ0J4HzejQB1N46O1OwU-dFH9oQgG-E',
    appId: '1:825380063892:web:454a1ffd8eb1c58395c281',
    messagingSenderId: '825380063892',
    projectId: 'freezedriverpod',
    authDomain: 'freezedriverpod.firebaseapp.com',
    storageBucket: 'freezedriverpod.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkHgsJ8vgru3meHNPNWUG8GPEUVi2YWaM',
    appId: '1:825380063892:android:f38109855efc843895c281',
    messagingSenderId: '825380063892',
    projectId: 'freezedriverpod',
    storageBucket: 'freezedriverpod.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBtq4UluZ7F4BUACl8i-QQqEGLRCrDf-o',
    appId: '1:825380063892:ios:23d56968eeaf847b95c281',
    messagingSenderId: '825380063892',
    projectId: 'freezedriverpod',
    storageBucket: 'freezedriverpod.appspot.com',
    iosClientId: '825380063892-3m369o6v0mjd4qvqtq5aevfop5polusu.apps.googleusercontent.com',
    iosBundleId: 'com.example.riverpodWithFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBtq4UluZ7F4BUACl8i-QQqEGLRCrDf-o',
    appId: '1:825380063892:ios:23d56968eeaf847b95c281',
    messagingSenderId: '825380063892',
    projectId: 'freezedriverpod',
    storageBucket: 'freezedriverpod.appspot.com',
    iosClientId: '825380063892-3m369o6v0mjd4qvqtq5aevfop5polusu.apps.googleusercontent.com',
    iosBundleId: 'com.example.riverpodWithFirebase',
  );
}
