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
    apiKey: 'AIzaSyCM5yYLWzwXaJFHiLP7l5hmYL-2KMfgV3Y',
    appId: '1:98091809515:web:fdb76daa4ab5d392aadcae',
    messagingSenderId: '98091809515',
    projectId: 'sakon-easy-tutorial',
    authDomain: 'sakon-easy-tutorial.firebaseapp.com',
    storageBucket: 'sakon-easy-tutorial.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-D3vbah5pLgPG8C4U9KCQDVWUxDAcs-s',
    appId: '1:98091809515:android:4d0448325b072aa8aadcae',
    messagingSenderId: '98091809515',
    projectId: 'sakon-easy-tutorial',
    storageBucket: 'sakon-easy-tutorial.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwckJPLxoZ99GyCO0cBMYn6LcsD0UWfLA',
    appId: '1:98091809515:ios:7d620e8047a8ba7faadcae',
    messagingSenderId: '98091809515',
    projectId: 'sakon-easy-tutorial',
    storageBucket: 'sakon-easy-tutorial.appspot.com',
    iosClientId: '98091809515-l44juoutojpjqs77gu9gg1u31ta6ma50.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseSample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwckJPLxoZ99GyCO0cBMYn6LcsD0UWfLA',
    appId: '1:98091809515:ios:7d620e8047a8ba7faadcae',
    messagingSenderId: '98091809515',
    projectId: 'sakon-easy-tutorial',
    storageBucket: 'sakon-easy-tutorial.appspot.com',
    iosClientId: '98091809515-l44juoutojpjqs77gu9gg1u31ta6ma50.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseSample',
  );
}
