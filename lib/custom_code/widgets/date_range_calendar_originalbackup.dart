// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';

class DateRangeCalendar extends StatefulWidget {
  const DateRangeCalendar({
    super.key,
    this.width,
    this.height,
    this.startDate,
    this.endDate,
  });

  final double? width;
  final double? height;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<DateRangeCalendar> createState() => _DateRangeCalendarState();
}

class _DateRangeCalendarState extends State<DateRangeCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[200],
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 9, 1),
        lastDay: DateTime.utc(2027, 11, 30),
        focusedDay: widget.startDate ?? DateTime.now(),
        rangeStartDay: widget.startDate,
        rangeEndDay: widget.endDate,
        calendarStyle: CalendarStyle(
            rangeHighlightColor: Color.fromARGB(255, 161, 152, 248)),
        calendarBuilders: CalendarBuilders(
          outsideBuilder: (context, date, _) {
            return Container(
              color: Colors.grey[200],
            );
          },
          rangeStartBuilder: (context, date, _) {
            return Container(
              margin: const EdgeInsets.only(bottom: 5),
              height: 40.0, // Set height for circular shape
              width: 40.0, // Set width for circular shape
              decoration: BoxDecoration(
                color: Color(0XFF6F61EF), // Highlight color for end day
                shape: BoxShape.circle, // Make it circular
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
          rangeEndBuilder: (context, date, _) {
            return Container(
              margin: const EdgeInsets.only(bottom: 5),
              height: 40.0, // Set height for circular shape
              width: 40.0, // Set width for circular shape
              decoration: BoxDecoration(
                color: Color(0XFF6F61EF), // Highlight color for end day
                shape: BoxShape.circle, // Make it circular
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
          // withinRangeBuilder: (context, date, _) {
          //   return _buildInRangeDay(date);
          // },
          defaultBuilder: (context, date, _) {
            return null; // Non-range dates will not have a special decoration.
          },
        ),
        rangeSelectionMode:
            RangeSelectionMode.disabled, // Disable range selection
      ),
    );
  }
}
