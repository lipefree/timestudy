import 'package:flutter/material.dart';

/// Time picker to add hours to a course
Future<TimeOfDay?> getTimePicker(BuildContext context) {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: 0, minute: 0),
    initialEntryMode: TimePickerEntryMode.inputOnly,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          ),
        ),
      );
    },
  );
}
