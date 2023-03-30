import 'package:flutter/material.dart';
import 'package:shikshamiraz/model/courses.dart';
import 'package:shikshamiraz/model/courses_video.dart';
import 'package:shikshamiraz/screens/home/videos/category_videotitle.dart';
import 'package:shikshamiraz/screens/home/widgets/category_title.dart';
import 'package:shikshamiraz/screens/home/videos/course_videoitem.dart';


class FeatureVideoCourse extends StatelessWidget {
  final courseList = Courses.generateCourse();

  FeatureVideoCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryVideoTitle('Videos Available', 'Watch All'),
        SizedBox(
            height: 300,
            child: ListView.separated(
                padding: const EdgeInsets.all(25),
                scrollDirection: Axis.horizontal,
                itemCount: courseList.length,
                itemBuilder: (content, index) =>
                    CourseVideoTitle(courseList[index]),
                separatorBuilder: (context, int index) => const SizedBox(
                      width: 15,
                    )))
      ],
    );
  }
}
