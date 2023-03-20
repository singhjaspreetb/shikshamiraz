import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/model/user_model.dart';
import 'package:shikshamiraz/screens/data/data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
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
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Container(
            width: 130,
            height: 130,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1331&q=80",
                    ),
                    fit: BoxFit.cover
              ),
              // borderRadius: BorderRadius.circular(100),
              // border: Border.all(width: 5, color: Colors.white),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(5, 5),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${loggedInUser.firstName} ${loggedInUser.secondName}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Student',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "User Information",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Card(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ...ListTile.divideTiles(
                              color: Colors.grey,
                              tiles: [
                                // const ListTile(
                                //   contentPadding: EdgeInsets.symmetric(
                                //       horizontal: 12, vertical: 4),
                                //   leading: Icon(Icons.my_location),
                                //   title: Text("Location"),
                                //   subtitle: Text("Chandiarh"),
                                // ),
                                ListTile(
                                  leading: Icon(Icons.email),
                                  title: Text("Email"),
                                  subtitle: Text("${loggedInUser.email}"),
                                ),
                                const ListTile(
                                  leading: Icon(Icons.phone),
                                  title: Text("Phone"),
                                  subtitle: Text("+91 6399031883"),
                                ),
                                // const ListTile(
                                //   leading: Icon(Icons.person),
                                //   title: Text("About Me"),
                                //   subtitle: Text(
                                //       "This is a about me link and you can khow about me in this section."),
                                // ),
                                DataAnalysis()
                              ],
                              
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
