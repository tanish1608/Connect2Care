import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA-7_SJe4wtl0MPzWAIWRMfhCFyKffqAD4",
            authDomain: "connect2-caree-2ny4tw.firebaseapp.com",
            projectId: "connect2-caree-2ny4tw",
            storageBucket: "connect2-caree-2ny4tw.appspot.com",
            messagingSenderId: "76858327014",
            appId: "1:76858327014:web:e63fd8fe4c843258496027"));
  } else {
    await Firebase.initializeApp();
  }
}
