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
    apiKey: 'AIzaSyB_BssjhZdMaj5-G0dwIEOvhDIBUww8si8',
    appId: '1:615383370368:web:8e95a326ab612d1514f465',
    messagingSenderId: '615383370368',
    projectId: 'my-local-test-firebase',
    authDomain: 'my-local-test-firebase.firebaseapp.com',
    databaseURL: 'https://my-local-test-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'my-local-test-firebase.appspot.com',
    measurementId: 'G-F2SZWMBMQ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3otKMT0Jva5iKrCekIMzXntf_5D66nrg',
    appId: '1:615383370368:android:d194feadd17984fc14f465',
    messagingSenderId: '615383370368',
    projectId: 'my-local-test-firebase',
    databaseURL: 'https://my-local-test-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'my-local-test-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9139hkcVpIfGDQ3XX0OmqZ_tFpis1KAw',
    appId: '1:615383370368:ios:fd82c42552c42e8d14f465',
    messagingSenderId: '615383370368',
    projectId: 'my-local-test-firebase',
    databaseURL: 'https://my-local-test-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'my-local-test-firebase.appspot.com',
    iosClientId: '615383370368-g1g2092qg8icdho81f2g5nlpr9905hvu.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastcamFlutterBeamin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9139hkcVpIfGDQ3XX0OmqZ_tFpis1KAw',
    appId: '1:615383370368:ios:30f8741c08f89b0a14f465',
    messagingSenderId: '615383370368',
    projectId: 'my-local-test-firebase',
    databaseURL: 'https://my-local-test-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'my-local-test-firebase.appspot.com',
    iosClientId: '615383370368-vv7ugnakueki70ouj19gj5kkhcc3th79.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastcamFlutterBeamin.RunnerTests',
  );
}
