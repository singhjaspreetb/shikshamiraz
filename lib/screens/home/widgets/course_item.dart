import 'package:flutter/material.dart';
import 'package:shikshamiraz/model/courses.dart';

class CourseItem extends StatelessWidget {
  final Course courses;
  CourseItem(this.courses);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 380,
            width: 197,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 233, 233),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: const Radius.circular(20),
                      ),
                      child: Image.asset(
                        courses.imgPath,
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          courses.course,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(courses.length,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                              color: Colors.amber, shape: BoxShape.circle),
                        ),
                        Text(
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
                    primary: Colors.blue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                onPressed: () {},
                child: Text('Start'),
              ))
        ],
      ),
    );
  }
}
