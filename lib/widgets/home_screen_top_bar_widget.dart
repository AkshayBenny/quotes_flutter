import 'package:flutter/material.dart';

class HomeScreenTopBarWidget extends StatefulWidget {
  const HomeScreenTopBarWidget({super.key});

  @override
  State<HomeScreenTopBarWidget> createState() => _HomeScreenTopBarWidgetState();
}

class _HomeScreenTopBarWidgetState extends State<HomeScreenTopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Quotes.",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
