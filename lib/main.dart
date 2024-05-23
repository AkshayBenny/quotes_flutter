import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 15, 18, 47),
      ),
      home: Center(child: HomeScreen()),
    );
  }
}
