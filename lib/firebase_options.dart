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
    apiKey: 'AIzaSyDLBO-O2JiUku-P8xp8_9S5cFa9Q_L0RFs',
    appId: '1:470172640064:web:0c74f11bd4c90f0968d0a5',
    messagingSenderId: '470172640064',
    projectId: 'tm8course',
    authDomain: 'tm8course.firebaseapp.com',
    storageBucket: 'tm8course.appspot.com',
    measurementId: 'G-BKMZGLG4R9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiQW3XS42PQ7jCXtH6_xR1w9a3Z2RkUyc',
    appId: '1:470172640064:android:f5b31c77859edf6168d0a5',
    messagingSenderId: '470172640064',
    projectId: 'tm8course',
    storageBucket: 'tm8course.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGdP5mRwlacbO8hlgdrzRHgtzZlLR3oTg',
    appId: '1:470172640064:ios:58f7c5912d1d9dd268d0a5',
    messagingSenderId: '470172640064',
    projectId: 'tm8course',
    storageBucket: 'tm8course.appspot.com',
    iosClientId: '470172640064-acguhm7qeq8itss7420dcmhbdeqq29l2.apps.googleusercontent.com',
    iosBundleId: 'com.example.tmCourse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGdP5mRwlacbO8hlgdrzRHgtzZlLR3oTg',
    appId: '1:470172640064:ios:58f7c5912d1d9dd268d0a5',
    messagingSenderId: '470172640064',
    projectId: 'tm8course',
    storageBucket: 'tm8course.appspot.com',
    iosClientId: '470172640064-acguhm7qeq8itss7420dcmhbdeqq29l2.apps.googleusercontent.com',
    iosBundleId: 'com.example.tmCourse',
  );
}
