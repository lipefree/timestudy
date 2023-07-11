import 'package:flutter/material.dart';
import 'package:namer_app/utils/duration.dart';

import '../../../data/course.dart';
import '../../../utils/hours_progression_colors.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {Key? key, required this.course, required this.onPressedAddHours})
      : super(key: key);

  final Course course;
  final Function(Course coursePressed) onPressedAddHours;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
        color: theme.colorScheme.surfaceVariant,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: AnimatedSize(
              duration: Duration(microseconds: 200),
              child: MergeSemantics(
                  child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularProgressIndicator(
                        value: course.currentMinutes / course.minutesPerWeek,
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
                          onPressed: () {
                            onPressedAddHours(course);
                          },
                          backgroundColor: theme.colorScheme.secondaryContainer,
                          elevation: 1,
                          child: Icon(
                            Icons.add,
                            semanticLabel: 'Add time',
                          ))
                    ],
                  )
                ],
              )),
            )));
  }
}
