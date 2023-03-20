import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shikshamiraz/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/chat/chat_screen.dart';
import 'package:shikshamiraz/screens/home/util/bottomnavigation.dart';
import 'package:shikshamiraz/screens/home/widgets/active_course.dart';
import 'package:shikshamiraz/screens/home/widgets/active_videocourse.dart';
import 'package:shikshamiraz/screens/home/widgets/below_text.dart';
import 'package:shikshamiraz/screens/home/widgets/below_videotext.dart';
import 'package:shikshamiraz/screens/home/widgets/feature_course.dart';
import 'package:shikshamiraz/screens/home/widgets/feature_videocourse.dart';
import 'package:shikshamiraz/screens/home/widgets/search_videoinput.dart';
import 'package:shikshamiraz/screens/leaderboard/leader_board.dart';
import 'package:shikshamiraz/screens/login_screen.dart';
import 'package:shikshamiraz/screens/profile/profile.dart';
import '../home/widgets/search_input.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPage createState() => _VideoPage();
}

class _VideoPage extends State<VideoPage> {
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
              // TestView(questions: {}, onQuizCompleted: (int ) {  },)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BelowVideoText(),
                  const SearchVideoInput(),
                  FeatureVideoCourse(),
                  const ActiveVideoCourse()
                ],
              ),
            } else if (index == 1) ...{
              const ChatScreen(),
            } else if (index == 2) ...{
              const LeaderBoard(),
            } else if (index == 3) ...{
              const ProfilePage(),
            }
          ],
        ),
      ),
      bottomNavigationBar: BottomNaviBar(
        press: (index) => _onNavPressed(index),
      ),
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
        backgroundColor: Colors.white24,
        elevation: 0,
        title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Hello ${loggedInUser.firstName} ${loggedInUser.secondName}',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            )));
  }
}
