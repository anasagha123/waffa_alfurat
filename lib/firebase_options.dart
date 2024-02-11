import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCLmQh5C1uUgNMqlcLw8EulVHZxE0O0wjs',
    appId: '1:366238610650:web:808ea88070be64dc8fa1e3',
    messagingSenderId: '366238610650',
    projectId: 'waffa-posts-notification',
    authDomain: 'waffa-posts-notification.firebaseapp.com',
    storageBucket: 'waffa-posts-notification.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1hYbejsRLrIC0GGy3IPGompFzuJ2bH0Q',
    appId: '1:366238610650:android:5c5e2ed8644840ac8fa1e3',
    messagingSenderId: '366238610650',
    projectId: 'waffa-posts-notification',
    storageBucket: 'waffa-posts-notification.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAMpKqWQmZrouvHM7siy84mmrY2wWCKrE',
    appId: '1:366238610650:ios:7f0bd7512090bcb18fa1e3',
    messagingSenderId: '366238610650',
    projectId: 'waffa-posts-notification',
    storageBucket: 'waffa-posts-notification.appspot.com',
    iosBundleId: 'com.example.waffatAlfurat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAAMpKqWQmZrouvHM7siy84mmrY2wWCKrE',
    appId: '1:366238610650:ios:00e3bebd2aff6a448fa1e3',
    messagingSenderId: '366238610650',
    projectId: 'waffa-posts-notification',
    storageBucket: 'waffa-posts-notification.appspot.com',
    iosBundleId: 'com.example.waffatAlfurat.RunnerTests',
  );
}
