import 'package:namer_app/data/course.dart';

/// Represemt how courses are stored and interface for communication with methods : [getCourses()] and [updateCourseMinutes()].
abstract class CoursesData {

  /// Returns the list of all the courses linked to the user
  Future<List<Course>> getCourses();

  /// Add the [minutes] to the given [course]
  Future<void> updateCourseMinutes(Course course, int minutes);
}