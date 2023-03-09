
import 'package:flutter/material.dart';

import 'package:tm_course/controller/courseProgress/course_progress.dart';
import 'package:tm_course/view/pages/course_view/course_view.dart';

import 'custom_course_widget.dart';

class MySliverList extends StatelessWidget {
  const MySliverList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomCourseWidget(
                lessionThatfinished: cppCourseFinished,
                image: 'assets/images/c.png',
                course: 'C++ Course for beginners',
                totalTime: '15',
                lessonsNum: '34',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseView(
                                courseFinished: cppCourseFinished,
                                image: 'assets/images/c.png',
                                // courseList: cplusplusCourse,
                                courseName: 'cpp',
                              )));
                },
              ),
              CustomCourseWidget(
                lessionThatfinished: dartCourseFinished,
                image: 'assets/images/dart.png',
                course: 'The Complete Dart Course',
                totalTime: '20',
                lessonsNum: '28',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseView(
                                image: 'assets/images/dart.png',
                                courseName: 'dart',
                                courseFinished: dartCourseFinished,
                              )));
                },
              ),
              CustomCourseWidget(
                lessionThatfinished: oopCourseFinished,
                image: 'assets/images/oop2.png',
                course: 'The Complete OOP  Course',
                lessonsNum: '16',
                totalTime: '20',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseView(
                                courseFinished: oopCourseFinished,
                                image: 'assets/images/oop2.png',
                                courseName: 'oop',
                              )));
                },
              ),
              CustomCourseWidget(
                lessionThatfinished: flutterCourseFinished,
                image: 'assets/images/flutter.png',
                course: 'The Complete Flutter Course',
                totalTime: '120',
                lessonsNum: '120',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseView(
                                courseFinished: flutterCourseFinished,
                                image: 'assets/images/flutter.png',
                                courseName: 'flutter',
                              )));
                },
              ),
              //qoute widget
              // QuoteWidget(),
            ],
          ),
        ),
      ),
    ]));
  }
}
