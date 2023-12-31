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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDin9odNdhNKabbNe_wiCeEFJOUbzw0hN8',
    appId: '1:292958277046:ios:623a4cbf566699ee300517',
    messagingSenderId: '292958277046',
    projectId: 'fir-tutorial-52670',
    databaseURL: 'https://fir-tutorial-52670-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-tutorial-52670.appspot.com',
    iosClientId: '292958277046-8g5v7g0pme5o3j6u61hng6mqsj5emi98.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseTutorial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDin9odNdhNKabbNe_wiCeEFJOUbzw0hN8',
    appId: '1:292958277046:ios:1db78aa6f8a09eab300517',
    messagingSenderId: '292958277046',
    projectId: 'fir-tutorial-52670',
    databaseURL: 'https://fir-tutorial-52670-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-tutorial-52670.appspot.com',
    iosClientId: '292958277046-fhqcasinqan5vbuvkeievtqfiss9bim0.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseTutorial.RunnerTests',
  );
}
