import 'package:shikshamiraz/screens/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:shikshamiraz/screens/styles/styles.dart';

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
              height: size.height / 4,
              width: size.width,
              color: Colors.green,
              child: SafeArea(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   children: [
                        //     Image.asset('assets/images/Back Icon.png'),
                        //     const SizedBox(
                        //       width: 12,
                        //     ),
                        //     Text('Category', style: AppStyle.m12w)
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
            height: size.height - (size.height / 5),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        LongCourseCard(
                            background: AppColors.pink,
                            title: 'Music Class',
                            subtitle: '10 Course',
                            image: 'assets/images/Music Course.png'),
                        ShortBottomCourseCard(
                            background: AppColors.purple,
                            title: 'Animation',
                            subtitle: '12 Course',
                            image: 'assets/images/Animation.png'),
                        ShortTopCourseCard(
                            background: AppColors.red,
                            title: 'Writing Class',
                            subtitle: '20 Course',
                            image: 'assets/images/Writing Class.png')
                      ],
                    ),
                    Column(
                      children: const [
                        ShortTopCourseCard(
                            background: AppColors.green,
                            title: '3D Illustration',
                            subtitle: '110 Course',
                            image: 'assets/images/3D Illustration.png'),
                        LongCourseCard(
                            background: AppColors.orange,
                            title: 'Design Class',
                            subtitle: '15 Course',
                            image: 'assets/images/Design Course.png'),
                        ShortBottomCourseCard(
                            background: AppColors.green,
                            title: 'Programmers',
                            subtitle: '20 Course',
                            image: 'assets/images/Programers.png')
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

class LongCourseCard extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const LongCourseCard(
      {Key? key,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      width: 155,
      height: 192,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.white, width: 10),
          boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: const Color(0xFF0B0C2A).withOpacity(.09),
                offset: const Offset(10, 10))
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 16),
        Text(title, style: AppStyle.m12w),
        Text(subtitle, style: AppStyle.r10wt),
        Expanded(child: Image.asset(image)),
      ]),
    );
  }
}

class ShortTopCourseCard extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const ShortTopCourseCard(
      {Key? key,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      width: 155,
      height: 163,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.white, width: 10),
          boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: const Color(0xFF0B0C2A).withOpacity(.09),
                offset: const Offset(10, 10))
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 16),
        Text(title, style: AppStyle.m12w),
        Text(subtitle, style: AppStyle.r10wt),
        Expanded(child: Image.asset(image)),
      ]),
    );
  }
}

class ShortBottomCourseCard extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const ShortBottomCourseCard(
      {Key? key,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      width: 155,
      height: 163,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.white, width: 10),
          boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: const Color(0xFF0B0C2A).withOpacity(.09),
                offset: const Offset(10, 10))
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 8),
        Expanded(child: Image.asset(image)),
        Text(title, style: AppStyle.m12w),
        Text(subtitle, style: AppStyle.r10wt),
        const SizedBox(height: 12),
      ]),
    );
  }
}
