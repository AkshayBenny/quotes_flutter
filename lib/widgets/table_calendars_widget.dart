import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/widgets/table_calenda_widget.dart';

class TableCalendarsWidget extends StatefulWidget {
  const TableCalendarsWidget({super.key, required this.userStreaks});
  final List<DateTime> userStreaks;

  @override
  State<TableCalendarsWidget> createState() => _TableCalendarsWidgetState();
}

class _TableCalendarsWidgetState extends State<TableCalendarsWidget> {
  final List<String> monthsList = [];
  final Map<String, List<DateTime>> userCalendarParsedData =
      <String, List<DateTime>>{};

  @override
  void initState() {
    for (int i = 0; i < widget.userStreaks.length; i++) {
      var month = widget.userStreaks[i].month;
      monthsList.add(month.toString());

      userCalendarParsedData[month.toString()] = [];
    }

    for (int i = 0; i < widget.userStreaks.length; i++) {
      var userDateTimeData = widget.userStreaks[i];
      userCalendarParsedData[userDateTimeData.month.toString()]!
          .add(userDateTimeData);
    }
    super.initState();
    // {1: [2024-01-17 13:51:10.794689], 2: [2024-02-16 13:51:10.794710], 3: [2024-03-02 13:51:10.794713, 2024-03-09 13:51:10.794716, 2024-03-10 13:51:10.794718, 2024-03-11 13:51:10.794721, 2024-03-12 13:51:10.794723, 2024-03-13 13:51:10.794725]}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ...userCalendarParsedData.isNotEmpty
              ? userCalendarParsedData.entries.map((entry) {
                  DateTime? firstDayOfMonth =
                      getDateRangeOfMonth(entry.value)['firstDayDate'];
                  DateTime? lastDayOfMonth =
                      getDateRangeOfMonth(entry.value)['lastDayDate'];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 27,
                      ),
                      TableCalendarWidget(
                        firstDay: firstDayOfMonth!,
                        lastDay: lastDayOfMonth!,
                        focusedDay: firstDayOfMonth,
                        userStreaks: widget.userStreaks,
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      //   const Divider(
                      //     color: Color.fromARGB(
                      //       229,
                      //       234,
                      //       246,
                      //       1,
                      //     ),
                      //   )
                    ],
                  );
                }).toList()
              : [
                  const SizedBox(height: 300),
                ],
        ],
      ),
    );
  }

  Map<String, DateTime> getDateRangeOfMonth(List<DateTime> dateList) {
    final oldestDate = dateList.reduce((a, b) => a.isBefore(b) ? a : b);
    final lastDayOfCurrentMonthDate =
        DateTime(oldestDate.year, oldestDate.month + 1, 0);

    return {
      'firstDayDate': oldestDate,
      'lastDayDate': lastDayOfCurrentMonthDate
    };
  }
}
