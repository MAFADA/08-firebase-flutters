// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCxF4qtjuPZMiOaorm7b35CJbC2c2oMzYw", // Your apiKey
      appId: "1:363754970570:android:9a0d129cb0bd0609880333", // Your appId
      messagingSenderId: "363754970570", // Your messagingSenderId
      projectId: "flutterfirebase-b0e15", // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
