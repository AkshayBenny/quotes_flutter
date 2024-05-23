import 'package:flutter/material.dart';

class ProfileButtonWidget extends StatelessWidget {
 const ProfileButtonWidget({super.key, required this.icon, required this.buttonText});

  final Widget icon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(255, 255, 255, 0.04),
        ),
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 16,
                ),
                Text(
                  buttonText,
                  style:
                      const TextStyle(color: Color.fromRGBO(134, 134, 134, 1)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
