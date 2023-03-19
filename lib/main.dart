import 'package:shikshamiraz/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDZYZfRclKOZTUKGM1kstIOTnYl-1Pvli8",
          appId: "1:637209427083:web:26124fac5a01dea2e8688e",
          messagingSenderId: "637209427083",
          projectId: "emailauth-beb60"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(background: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
