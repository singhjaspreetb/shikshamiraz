import 'package:flutter/material.dart';
import 'package:shikshamiraz/model/courses.dart';

import '../../Subject/subject_page.dart';

class CourseVideoTitle extends StatelessWidget {
  final Course courses;
  const CourseVideoTitle(this.courses, {super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380,
          width: 197,
          decoration: BoxDecoration(
              color: const Color.fromARGB(0, 250, 233, 233),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      courses.imgPath,
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        courses.course,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(courses.length,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black)),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                            color: Colors.amber, shape: BoxShape.circle),
                      ),
                      const Text(
                        '2 h 32 minutes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SubjectPage()));
              },
              child: const Text('Start'),
            ))
      ],
    );
  }
}
