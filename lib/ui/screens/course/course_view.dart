import 'package:flutter/material.dart';

import '../../../data/course.dart';

class CourseView extends StatelessWidget {
  const CourseView({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(course.name)), body: Text(course.courseId));
  }
}
