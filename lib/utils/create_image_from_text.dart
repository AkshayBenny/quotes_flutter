import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';

Future<String> createImageFromText(String text) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  // Define the paint style for the text
  final textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40, // Adjust the size accordingly
      ),
    ),
    textDirection: TextDirection.ltr,
  );

  textPainter.layout();

  // Drawing the black background
  canvas.drawRect(
    Rect.fromLTWH(0, 0, textPainter.width, textPainter.height),
    Paint()..color = Colors.black,
  );

  // Drawing the text
  textPainter.paint(canvas, const Offset(0, 0));

  // Finalizing the image
  final picture = recorder.endRecording();
  final img = await picture.toImage(textPainter.width.toInt(), textPainter.height.toInt());
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final buffer = byteData!.buffer.asUint8List();

  // Saving the image to a file
  final directory = (await getApplicationDocumentsDirectory()).path;
  File imgFile = File('$directory/text_image.png');
  await imgFile.writeAsBytes(buffer);

  return imgFile.path;
}
