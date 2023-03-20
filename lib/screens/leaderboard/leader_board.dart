import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/model/user_model.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40),
          height: 330,
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Column(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1331&q=80"),
                    radius: 50,
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.purpleAccent,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${loggedInUser.firstName} ${loggedInUser.secondName}",
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "45",
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.9)),
                      ),
                      const Text("Level",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("#335",
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.9))),
                      const Text("Rank",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Leaderboard",
          style: TextStyle(fontSize: 20),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: SizedBox(
            height: 300,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1331&q=80"),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                            "${loggedInUser.firstName} ${loggedInUser.secondName}")
                      ],
                    ),
                    leading: Text(
                      "#${index + 1}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                        "Points ${(200000 / (index + 1)).toString().substring(0, 5)}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      color: Colors.green,
                      indent: 10,
                      endIndent: 10,
                    ),
                itemCount: 12),
          ),
        )
      ],
    );
  }
}
