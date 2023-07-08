import 'package:namer_app/data/course.dart';

abstract class CoursesData {
  Future<List<Course>> getCourses();
}