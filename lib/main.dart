import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/app.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyDSr6rRngSKZTy3jzeYNlvckGXoxs2ViwQ",
  authDomain: "taks-list-bec6c.firebaseapp.com",
  projectId: "taks-list-bec6c",
  storageBucket: "taks-list-bec6c.appspot.com",
  messagingSenderId: "153844128861",
  appId: "1:153844128861:web:4a96cdbc75f00f105401b4"
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: firebaseConfig
  );

  runApp(App());
}

