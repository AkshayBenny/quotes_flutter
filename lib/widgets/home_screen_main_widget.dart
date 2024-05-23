import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/models/quote.dart';
import 'package:quotes_app_flutter/utils/create_image_from_text.dart';
import 'package:social_share/social_share.dart';

class HomeScreenMainWidget extends StatefulWidget {
  const HomeScreenMainWidget({super.key, required this.quote});

  final Quote quote;

  @override
  State<HomeScreenMainWidget> createState() => _HomeScreenMainWidgetState();
}

class _HomeScreenMainWidgetState extends State<HomeScreenMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(),
        Text(
          '"${widget.quote.quote}"',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20), // Add space between text and button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                backgroundColor: Colors.white.withOpacity(0.12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Icon(Icons.favorite), // Add text color
            ),
            const SizedBox(
              width: 24,
            ),
            FilledButton(
              onPressed: () async {
                try {
                  String imagePath = await createImageFromText(widget.quote.quote);
                  // Attempt to share to Instagram Story and capture the response as a String?
                  String? result = await SocialShare.shareInstagramStory(
                    appId: '720050726869433',
                    imagePath: imagePath,
                    backgroundTopColor: "#ffffff",
                    backgroundBottomColor: "#000000",
                  );

                  // Check the result and act accordingly
                  if (result != null && result.isNotEmpty) {
                    print("Sharing Result: $result");
                    // Handle success or specific result here. The actual handling will depend on the response content.
                  } else {
                    print("Sharing failed or was cancelled");
                  }
                } catch (e) {
                  print("Error sharing to Instagram Story: $e");
                }
              },
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(42, 12, 42, 12),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Share",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
      ],
    );
  }
}
