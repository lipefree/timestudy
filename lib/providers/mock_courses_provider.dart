import 'package:namer_app/data/course.dart';
import 'package:namer_app/providers/courses_provider.dart';

class MockCoursesData implements CoursesData {
  var analyse = Course("Analyse", "MATH-101", 13 * 60, 10 * 60);
  var algebre = Course("Algebre", "MATH-102", 13 * 60, 4 * 60);
  var physique = Course("Physique", "PHY-101", 13 * 60, 3 * 60);

  @override
  Future<List<Course>> getCourses() {
    return Future(() => [analyse, algebre, physique]);
  }

  @override
  Future<Course> updateCourseMinutes(Course course, int minutes) {
    if (course.name == "Analyse") {
      analyse = Course(course.name, course.courseId, course.minutesPerWeek,
          course.currentMinutes + minutes);
      return Future.value(analyse);
    } else if (course.name == "Algebre") {
      algebre = Course(course.name, course.courseId, course.minutesPerWeek,
          course.currentMinutes + minutes);
      return Future.value(algebre);
    } else {
      physique = Course(course.name, course.courseId, course.minutesPerWeek,
          course.currentMinutes + minutes);
      return Future.value(physique);
    }
  }
}
