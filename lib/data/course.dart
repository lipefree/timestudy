/// Represent a school `Course' with its [name], [courseId] and the estimated amount of workd
/// per week in minutes as [minutesPerWeek]. Also keeps track of the [currentMinutes] worked. 
class Course { 
  final String name;
  final String courseId; 
  final int minutesPerWeek;
  final int currentMinutes;

  Course(this.name, this.courseId, this.minutesPerWeek, this.currentMinutes);
}