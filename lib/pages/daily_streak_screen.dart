import 'package:quotes_app_flutter/widgets/table_calendars_widget.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/widgets/bottom_nav_bar.dart';
import 'package:quotes_app_flutter/widgets/home_screen_top_bar_widget.dart';

class DailyStreakScreen extends StatefulWidget {
  const DailyStreakScreen({super.key});

  @override
  State<DailyStreakScreen> createState() => _DailyStreakScreenState();
}

class _DailyStreakScreenState extends State<DailyStreakScreen> {
  List<DateTime> userStreaks = [
    DateTime.now().subtract(const Duration(days: 60)),
    DateTime.now().subtract(const Duration(days: 30)),
    DateTime.now().subtract(const Duration(days: 15)),
    DateTime.now().subtract(const Duration(days: 8)),
    DateTime.now().subtract(const Duration(days: 7)),
    DateTime.now().subtract(const Duration(days: 6)),
    DateTime.now().subtract(const Duration(days: 5)),
    DateTime.now().subtract(const Duration(days: 4)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const HomeScreenTopBarWidget(),
      ),
      body: PageView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
              child: Column(
                children: [
                  TableCalendarsWidget(userStreaks: userStreaks),
                  const Divider(
                    color: Color(0xFFE5EAF6),
                    thickness: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
