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
    apiKey: 'AIzaSyDYOgEqx5rtS2OaySAxMomgqbb-LspgKlY',
    appId: '1:717023932532:web:ba0146428d813ba5846121',
    messagingSenderId: '717023932532',
    projectId: 'nursa-4f6aa',
    authDomain: 'nursa-4f6aa.firebaseapp.com',
    storageBucket: 'nursa-4f6aa.appspot.com',
    measurementId: 'G-T6DE3K9CXL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXBOSKL7c4gpVq5yOAevHE5_cfGzo2wXg',
    appId: '1:717023932532:android:cc695a480612cce0846121',
    messagingSenderId: '717023932532',
    projectId: 'nursa-4f6aa',
    storageBucket: 'nursa-4f6aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDf2BmHfldjSLeEGWVoOge1idXTfr2WjQk',
    appId: '1:717023932532:ios:ed5abd9ad89b7db0846121',
    messagingSenderId: '717023932532',
    projectId: 'nursa-4f6aa',
    storageBucket: 'nursa-4f6aa.appspot.com',
    iosClientId: '717023932532-a11n2bish5ehdvf20ehlpk837d3r52ko.apps.googleusercontent.com',
    iosBundleId: 'com.example.nursa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDf2BmHfldjSLeEGWVoOge1idXTfr2WjQk',
    appId: '1:717023932532:ios:ed5abd9ad89b7db0846121',
    messagingSenderId: '717023932532',
    projectId: 'nursa-4f6aa',
    storageBucket: 'nursa-4f6aa.appspot.com',
    iosClientId: '717023932532-a11n2bish5ehdvf20ehlpk837d3r52ko.apps.googleusercontent.com',
    iosBundleId: 'com.example.nursa',
  );
}
