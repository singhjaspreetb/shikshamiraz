import 'package:shikshamiraz/screens/Subject/subject_page.dart';
import 'package:shikshamiraz/screens/home/home_screen.dart';
import 'package:shikshamiraz/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/test/test.home.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();await Firebase.initializeApp(
    name: 'shikshamiraz',
      options: const FirebaseOptions(
          apiKey: "AIzaSyDZYZfRclKOZTUKGM1kstIOTnYl-1Pvli8",
          appId: "1:637209427083:web:26124fac5a01dea2e8688e",
          messagingSenderId: "637209427083",
          projectId: "emailauth-beb60"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      // home: TestView(
      //   onQuizCompleted: (int) {
      //   },
      //   questions: const {
      //     "questions": {
      //       "1": {
      //         "question":
      //             "What is the equation for the force of gravity between two objects?",
      //         "options": {
      //           "A": "F = ma",
      //           "B": "F = G(m1m2)/d^2",
      //           "C": "E = mc^2",
      //           "D": "P = F/A"
      //         },
      //         "answer": "B"
      //       },
      //       "2": {
      //         "question": "What is the formula for kinetic energy?",
      //         "options": {
      //           "A": "E = mc^2",
      //           "B": "F = ma",
      //           "C": "P = F/A",
      //           "D": "K = 1/2mv^2"
      //         },
      //         "answer": "D"
      //       },
      //       "3": {
      //         "question": "What is the speed of light?",
      //         "options": {
      //           "A": "299,792,458 m/s",
      //           "B": "186,000 mi/s",
      //           "C": "3.0 x 10^8 km/h",
      //           "D": "All of the above"
      //         },
      //         "answer": "A"
      //       }
      //     }
      //   },
      // ),
      home: const LoginScreen(),
    );
  }
}
