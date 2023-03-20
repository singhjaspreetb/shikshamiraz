import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/home/widgets/category_title.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActiveCourse extends StatelessWidget {
  const ActiveCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryTitle("Active Courses", "View All courses"),
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
                  'Laws of Motioniiiiii',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text("2 more lessons left",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ))
              ],
            ),
            //   ],
            // ),
            Expanded(
              child: CircularPercentIndicator(
                radius: 40,
                lineWidth: 5.0,
                percent: 0.75,
                center: const Text(
                  "75%",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                progressColor: Colors.amber,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
