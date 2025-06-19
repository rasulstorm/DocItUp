import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAs3Dl0EZrLbmq-N7uyootqn6yxXs27SMc",
            authDomain: "health-a-i-7mh17d.firebaseapp.com",
            projectId: "health-a-i-7mh17d",
            storageBucket: "health-a-i-7mh17d.firebasestorage.app",
            messagingSenderId: "546392719623",
            appId: "1:546392719623:web:14e3326007b294bac2c5a2"));
  } else {
    await Firebase.initializeApp();
  }
}
