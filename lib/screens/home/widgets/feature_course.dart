import 'package:flutter/material.dart';

import '../../../model/courses.dart';
import 'category_title.dart';
import 'course_item.dart';

class FeatureCourse extends StatelessWidget {
  final courseList = Course.generateCourse();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CategoryTitle('Courses Available', 'View All'),
        Container(
            height: 300,
            child: ListView.separated(
                padding: EdgeInsets.all(25),
                scrollDirection: Axis.horizontal,
                itemCount: courseList.length,
                itemBuilder: (content, index) => CourseItem(courseList[index]),
                separatorBuilder: (context, int index) => SizedBox(
                      width: 15,
                    )))
      ],
    ));
  }
}
