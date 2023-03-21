import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/home/widgets/category_title.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shikshamiraz/screens/test/test_home.dart';
import 'package:shikshamiraz/screens/test/util/testresult.dart';

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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TestHome(questions: {
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
                      },)));
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
