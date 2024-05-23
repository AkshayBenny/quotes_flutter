import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends StatefulWidget {
  const TableCalendarWidget(
      {super.key,
      required this.firstDay,
      required this.lastDay,
      required this.focusedDay,
      required this.userStreaks});
  
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final List<DateTime> userStreaks;
  @override
  State<TableCalendarWidget> createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState extends State<TableCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      availableGestures: AvailableGestures.none,
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(color: Colors.orange),
        weekendTextStyle: TextStyle(color: Colors.red),
        outsideTextStyle: TextStyle(color: Color.fromARGB(255, 230, 230, 230)),
      ),
      firstDay: widget.firstDay,
      lastDay: widget.lastDay,
      focusedDay: widget.focusedDay,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          for (DateTime streakDay in widget.userStreaks) {
            if (day.year == streakDay.year &&
                day.month == streakDay.month &&
                day.day == streakDay.day) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 61, 61, 61), // Highlight color
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          }
          return null; // Fallback to default styling
        },
      ),
    );
  }
}
