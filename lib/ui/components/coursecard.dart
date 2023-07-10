
import 'package:flutter/material.dart';
import 'package:namer_app/utils/duration.dart';

import '../../data/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course,
    required this.onPressed 
  }) : super(key: key);

  final Course course;
  final Function(Course coursePressed) onPressed;

  /// Helper function to compute the color of the time indicator based on the amount of work done
  Color hoursProgressionColor(Course course) { 
    double quarter = course.minutesPerWeek/4;
    if(course.currentMinutes < quarter) {
      return Colors.red;
    } else if(quarter <= course.currentMinutes && course.currentMinutes < 2*quarter) {
      return Colors.orange;
    } else if(2*quarter <= course.currentMinutes && course.currentMinutes < 3*quarter ){ 
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration : Duration(microseconds: 200),
          child: MergeSemantics(
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      CircularProgressIndicator(
                        value: course.currentMinutes/course.minutesPerWeek,
                        color: hoursProgressionColor(course),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.name,
                            style: theme.textTheme.titleLarge,
                            selectionColor: theme.colorScheme.onSurfaceVariant,
                          ),
                          Text(
                            course.courseId,
                            style: theme.textTheme.bodySmall,  
                          )
                        ],
                      ),

                    Text(
                      DurationHandler.minutesToString(course.currentMinutes),
                      style: theme.textTheme.displaySmall,
                      ),

                    FloatingActionButton(
                      onPressed: () {onPressed(course);},
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      elevation: 0,
                      child: Icon(Icons.add, semanticLabel: 'Add time',)
                    )                  
                   ],
                  )
                ],
              )
            ),
         )
      )
    );  
  }
}