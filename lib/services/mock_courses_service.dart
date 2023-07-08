import 'package:namer_app/data/course.dart';
import 'package:namer_app/services/courses_service.dart';

class MockCoursesData implements CoursesData {

  final analyse = Course("Analyse", "MATH-101", 13, 10);
  final algebre = Course("Algebre", "MATH-102", 13, 4);
  final physique = Course("Physique", "PHY-101", 13, 3);

  @override
  Future<List<Course>> getCourses() {
    return Future(() => [analyse, algebre, physique]);
  } 
}