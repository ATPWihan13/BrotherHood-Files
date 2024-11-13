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
    apiKey: 'AIzaSyDWllhlSO9uDV5rcJMDsqqFRgd1rAVCH44',
    appId: '1:628479032308:web:9ee0dc633bbad12ff617a1',
    messagingSenderId: '628479032308',
    projectId: 'brotherhoodfiles-e1831',
    authDomain: 'brotherhoodfiles-e1831.firebaseapp.com',
    storageBucket: 'brotherhoodfiles-e1831.firebasestorage.app',
    measurementId: 'G-H00NFGS6JW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYzpM4lVCnVSEmV6iV6h7KlOhMvx4JvLU',
    appId: '1:628479032308:android:4a640f214087ba34f617a1',
    messagingSenderId: '628479032308',
    projectId: 'brotherhoodfiles-e1831',
    storageBucket: 'brotherhoodfiles-e1831.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFoXzluvsUCCq72Zd4Mgf15WNLW4_ie3k',
    appId: '1:628479032308:ios:17edee08ec10cf54f617a1',
    messagingSenderId: '628479032308',
    projectId: 'brotherhoodfiles-e1831',
    storageBucket: 'brotherhoodfiles-e1831.firebasestorage.app',
    iosBundleId: 'com.example.brotherhood',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDWllhlSO9uDV5rcJMDsqqFRgd1rAVCH44',
    appId: '1:628479032308:web:882cf1a9ae396387f617a1',
    messagingSenderId: '628479032308',
    projectId: 'brotherhoodfiles-e1831',
    authDomain: 'brotherhoodfiles-e1831.firebaseapp.com',
    storageBucket: 'brotherhoodfiles-e1831.firebasestorage.app',
    measurementId: 'G-SDH19NFLG0',
  );
}