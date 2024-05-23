import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/widgets/bottom_nav_bar.dart';
import 'package:quotes_app_flutter/widgets/home_screen_top_bar_widget.dart';
import 'package:quotes_app_flutter/widgets/profile_button_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const HomeScreenTopBarWidget(),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SOCIAL",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color.fromRGBO(134, 134, 134, 1),
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const ProfileButtonWidget(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              buttonText: "Share",
            ),
            const SizedBox(
              height: 6,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/instagram.png"),
              buttonText: "Instagram",
            ),
            const SizedBox(
              height: 6,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/star.png"),
              buttonText: "Rate Our App",
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "OTHER",
              style: TextStyle(
                color: Color.fromRGBO(134, 134, 134, 1),
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/translate.png"),
              buttonText: "Language",
            ),
            const SizedBox(
              height: 6,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/comment.png"),
              buttonText: "Send Feedback",
            ),
            const SizedBox(
              height: 6,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/question.png"),
              buttonText: "FAQ",
            ),
            const SizedBox(
              height: 6,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/usd-circle.png"),
              buttonText: "Subscription Info",
            ),
            const SizedBox(
              height: 6,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/lock.png"),
              buttonText: "Privacy Policy",
            ),
            const SizedBox(
              height: 6,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/book.png"),
              buttonText: "Terms Of Use",
            ),
            const SizedBox(
              height: 6,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/bell.png"),
              buttonText: "Notifications",
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "ACCOUTN",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(134, 134, 134, 1),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/account.png"),
              buttonText: "Account",
            ),
            const SizedBox(
              height: 6,
            ),
            ProfileButtonWidget(
              icon: Image.asset("assets/icons/logout.png"),
              buttonText: "Logout",
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      )),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
