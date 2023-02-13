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
    apiKey: 'AIzaSyDggNdT0RllS86bgNqABrgizjLKkEpyPSM',
    appId: '1:492090198253:web:d3445cbb85f7adade464e4',
    messagingSenderId: '492090198253',
    projectId: 'innoscripta-challenge',
    authDomain: 'innoscripta-challenge.firebaseapp.com',
    storageBucket: 'innoscripta-challenge.appspot.com',
    measurementId: 'G-0MW8ZL7VMM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNaCiqgclSuJGG7PHjyi1BSKyBoVG_uy8',
    appId: '1:492090198253:android:385440a56947c87ce464e4',
    messagingSenderId: '492090198253',
    projectId: 'innoscripta-challenge',
    storageBucket: 'innoscripta-challenge.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsnl3ZcmhCzdKb8tZjAe8v7-lckKM2uyA',
    appId: '1:492090198253:ios:a9e5328232cfdba9e464e4',
    messagingSenderId: '492090198253',
    projectId: 'innoscripta-challenge',
    storageBucket: 'innoscripta-challenge.appspot.com',
    iosClientId: '492090198253-jfbd906qv161a9h9rq63n6cmvgldj649.apps.googleusercontent.com',
    iosBundleId: 'com.example.stimeStrack',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsnl3ZcmhCzdKb8tZjAe8v7-lckKM2uyA',
    appId: '1:492090198253:ios:a9e5328232cfdba9e464e4',
    messagingSenderId: '492090198253',
    projectId: 'innoscripta-challenge',
    storageBucket: 'innoscripta-challenge.appspot.com',
    iosClientId: '492090198253-jfbd906qv161a9h9rq63n6cmvgldj649.apps.googleusercontent.com',
    iosBundleId: 'com.example.stimeStrack',
  );
}
