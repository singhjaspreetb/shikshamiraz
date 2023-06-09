import 'package:flutter/material.dart';
import 'package:shikshamiraz/model/courses.dart';
import 'package:shikshamiraz/screens/home/widgets/category_title.dart';
import 'package:shikshamiraz/screens/home/widgets/course_item.dart';
class FeatureCourse extends StatelessWidget {
  final courseList = Course.generateCourse();

  FeatureCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    const CategoryTitle('Courses Available', 'View All'),
    SizedBox(
        height: 300,
        child: ListView.separated(
            padding: const EdgeInsets.all(25),
            scrollDirection: Axis.horizontal,
            itemCount: courseList.length,
            itemBuilder: (content, index) => CourseItem(courseList[index]),
            separatorBuilder: (context, int index) => const SizedBox(
                  width: 15,
                )))
      ],
    );
  }
}
