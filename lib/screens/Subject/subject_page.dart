import 'package:shikshamiraz/screens/Subject/longcourse_card.dart';
import 'package:shikshamiraz/screens/Subject/shortbottom_card.dart';
import 'package:shikshamiraz/screens/Subject/shortcourse_card.dart';
import 'package:shikshamiraz/screens/Subject/video_page.dart';
import 'package:shikshamiraz/common/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:shikshamiraz/common/styles/styles.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subject Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Gordita',
      ),
      home: const CategoryPage(),
    );
  }
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              padding: const EdgeInsets.only(left: 24),
              height: size.height / 4.5,
              width: size.width,
              // color: Colors.green,
              decoration: const BoxDecoration(
                  color: AppColors.purple,
                  image: DecorationImage(
                      image: AssetImage('assets/images/BG-Gradient.png'),
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.cover)),
              child: SafeArea(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   children: [
                        //     Image.asset('assets/images/BackIcon.png'),
                        //     const SizedBox(
                        //       width: 12,
                        //     ),
                        //     // Text('Category', style: AppStyle.m12w)
                        //   ],
                        // ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Choose the topic you want to learn',
                          style: AppStyle.b32w,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Choose your chapters',
                          style: AppStyle.r12w,
                        )
                      ],
                    )),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            height: size.height - (size.height / 4),
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(34)),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    'All Available Chapters',
                    style: AppStyle.m12b
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  // Text('Favourite', style: AppStyle.m12bt),
                  // const SizedBox(
                  //   width: 30,
                  // ),
                  // Text('Recommended', style: AppStyle.m12bt)
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Column(
                        children: const [
                          LongCourseCard(
                            background: AppColors.pink,
                            title: 'Laws of Motion',
                            subtitle: 'Video and Quiz',
                            image: 'assets/images/Music Course.png',
                          ),
                          ShortBottomCourseCard(
                              background: AppColors.purple,
                              title: 'Laws of Motion',
                              subtitle: 'Video and Quiz',
                              image: 'assets/images/Animation.png'),
                          ShortTopCourseCard(
                              background: AppColors.red,
                              title: 'Laws of Motion',
                              subtitle: 'Video and Quiz',
                              image: 'assets/images/Writing Class.png')
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPage()));
                      },
                    ),
                    Column(
                      children: const [
                        ShortTopCourseCard(
                            background: AppColors.green,
                            title: 'Laws of Motion',
                            subtitle: 'Video and Quiz',
                            image: 'assets/images/3D Illustration.png'),
                        LongCourseCard(
                            background: AppColors.orange,
                            title: 'Laws of Motion',
                            subtitle: 'Video and Quiz',
                            image: 'assets/images/Design Course.png'),
                        ShortBottomCourseCard(
                            background: AppColors.green,
                            title: 'Laws of Motion',
                            subtitle: 'Video and Quiz',
                            image: 'assets/images/Programers.png'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
