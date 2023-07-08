
import 'package:flutter/material.dart';

import '../../data/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );  

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
                      //TODO: Choose a library + standard for time management
                      course.currentHours.toString(),
                      style: theme.textTheme.displayMedium,
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