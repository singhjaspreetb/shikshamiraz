import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shikshamiraz/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/data/data.dart';
import 'package:shikshamiraz/screens/home/util/bottomnavigation.dart';
import 'package:shikshamiraz/screens/home/widgets/active_course.dart';
import 'package:shikshamiraz/screens/home/widgets/below_text.dart';
import 'package:shikshamiraz/screens/home/widgets/feature_course.dart';
import 'package:shikshamiraz/screens/leaderboard/leader_board.dart';
import 'package:shikshamiraz/screens/login_screen.dart';
import 'package:shikshamiraz/screens/profile/profile.dart';
import 'package:shikshamiraz/screens/test/test.home.dart';
import 'widgets/search_input.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  int index = 0;
  void _onNavPressed(int index) {
    setState(() {
      this.index = index;
    });
  }
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApp(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (index == 0) ...{
              Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [const BelowText(), const SearchInput(), FeatureCourse(), const ActiveCourse()],
      ),
            } else if (index == 1) ...{
              const LeaderBoard(),
            } else if (index == 2) ...{
              const ProfilePage(),
            }
          ],
        ),
      ),
            bottomNavigationBar: BottomNaviBar(press: (index) => _onNavPressed(index),),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
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
