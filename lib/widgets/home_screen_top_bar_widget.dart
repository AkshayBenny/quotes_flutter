import 'package:flutter/material.dart';

class HomeScreenTopBarWidget extends StatefulWidget {
  const HomeScreenTopBarWidget({super.key});

  @override
  State<HomeScreenTopBarWidget> createState() => _HomeScreenTopBarWidgetState();
}

class _HomeScreenTopBarWidgetState extends State<HomeScreenTopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Quotes.",
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.offline_bolt_outlined,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.apps_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
