import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shikshamiraz/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/home/widgets/below_text.dart';
import 'package:shikshamiraz/screens/home/widgets/course_item.dart';
import 'package:shikshamiraz/screens/test/test.home.dart';
import '../../model/courses.dart';
import 'widgets/category_title.dart';
import 'widgets/search_input.dart';

import '../login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApp(),
      body: TestView(
        onQuizCompleted: (int) {
        },
        questions: {
            "1": {
              "question":
                  "What is the equation for the force of gravity between two objects?",
              "options": {
                "A": "F = ma",
                "B": "F = G(m1m2)/d^2",
                "C": "E = mc^2",
                "D": "P = F/A"
              },
              "answer": "B"
            },
            "2": {
              "question": "What is the formula for kinetic energy?",
              "options": {
                "A": "E = mc^2",
                "B": "F = ma",
                "C": "P = F/A",
                "D": "K = 1/2mv^2"
              },
              "answer": "D"
            },
            "3": {
              "question": "What is the speed of light?",
              "options": {
                "A": "299,792,458 m/s",
                "B": "186,000 mi/s",
                "C": "3.0 x 10^8 km/h",
                "D": "All of the above"
              },
              "answer": "A"
            }
        },
      ),
      // body: SingleChildScrollView(
      //     child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     BelowText(),
      //     SearchInput(),
      //     CategoryTitle('Courses Available', 'View All'),
      //     CourseItem(
      //       Course('assets/images/physics.png', 'Physics', 'Total Length'),
      //     ),
      //   ],
      // )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart),
            label: 'LeaderBoard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  AppBar _buildApp() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Hello ${loggedInUser.firstName} ${loggedInUser.secondName}',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            )));
  }
}
