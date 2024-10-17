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
    apiKey: 'AIzaSyCOr2rsAY-yq8ogNzCBI-gFOxFpwAtvi9k',
    appId: '1:985413801317:web:0231aaf5822d43371c3d8c',
    messagingSenderId: '985413801317',
    projectId: 'flexxbet',
    authDomain: 'flexxbet.firebaseapp.com',
    databaseURL: 'https://flexxbet-default-rtdb.firebaseio.com',
    storageBucket: 'flexxbet.appspot.com',
    measurementId: 'G-0GDBX3YHPY',
  );

  static const FirebaseOptions android = FirebaseOptions(
      appId: "1:985413801317:android:0b0b1942470bfd9a1c3d8c",
      apiKey: "AIzaSyCOr2rsAY-yq8ogNzCBI-gFOxFpwAtvi9k",
      databaseURL: "https://flexxbet-default-rtdb.firebaseio.com",
      authDomain: "flexxbet.firebaseapp.com",
      projectId: "flexxbet",
      storageBucket: "flexxbet.appspot.com",
      messagingSenderId: "985413801317",
      measurementId: "G-0GDBX3YHPY"
  );

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyCOr2rsAY-yq8ogNzCBI-gFOxFpwAtvi9k",
      appId: "1:985413801317:ios:9b85bfa4b2771c6a1c3d8c",
      messagingSenderId: "985413801317",
      projectId: "flexxbet",
      databaseURL: "https://flexxbet-default-rtdb.firebaseio.com",
      storageBucket: "flexxbet.appspot.com",
      authDomain: "flexxbet.firebaseapp.com",
      measurementId: "G-0GDBX3YHPY"
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOr2rsAY-yq8ogNzCBI-gFOxFpwAtvi9k',
    appId: '1:985413801317:ios:d0656a5c635a5b8d1c3d8c',
    messagingSenderId: '985413801317',
    projectId: 'flexxbet',
    databaseURL: 'https://flexxbet-default-rtdb.firebaseio.com',
    storageBucket: 'flexxbet.appspot.com',
    androidClientId: '985413801317-1lkkptge105fv8sh6oac1feq0n49p9n5.apps.googleusercontent.com',
    iosClientId: '985413801317-iij0djimac2eh35e17ql64pktrcpbcnm.apps.googleusercontent.com',
    iosBundleId: 'com.flexxbet.app.RunnerTests',
  );
}
