import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/home/widgets/category_title.dart';
import 'package:shikshamiraz/screens/test/test_home.dart';
import 'package:http/http.dart' as http;

class ActiveVideoCourse extends StatelessWidget {
  const ActiveVideoCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryTitle("Take Quiz", " "),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
              borderRadius: BorderRadius.circular(8)),
          child: Row(children: [
            // Row(
            //   children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/images/physics.png', width: 100)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Take a quiz',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Positioned(
                  bottom: 40,
                  right: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () async {
                      String pt = "lawsofmotion";
                      var url = Uri.parse(
                          'http://127.0.0.1:5000/api/ques?data=lawsofmotion');
                      print(url);
                      var response = await http.get(url);
                      // print(response.body);
                      var body = response.body;
                      // var myJson = json
                      //     .decode(response.body);
                          final json = jsonDecode(body) as Map<String, dynamic>;
                      final data = Map<String, Map<String, dynamic>>.from(json.cast<String, Map<String, dynamic>>());

                          // .cast<Map<String, Map<String, dynamic>>>();
                      print(data);
                      // print(myJson);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TestHome(
                                questions: data,
                              )));
                    },
                    child: const Text('Start'),
                  )),
            )
          ]),
        ),
      ],
    );
  }
}
