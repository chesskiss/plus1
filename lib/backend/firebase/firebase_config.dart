import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCIJ1b2T_VI4ZUiEwuru1-XZ5B56WACNnc",
            authDomain: "plus-1-app.firebaseapp.com",
            projectId: "plus-1-app",
            storageBucket: "plus-1-app.appspot.com",
            messagingSenderId: "362267515064",
            appId: "1:362267515064:web:bbdaecf2232e4b68347c4d",
            measurementId: "G-BSBSZSP1WR"));
  } else {
    await Firebase.initializeApp();
  }
}
