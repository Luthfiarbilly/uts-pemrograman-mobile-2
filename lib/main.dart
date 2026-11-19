import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const UtsMobileApp());
}

class UtsMobileApp extends StatelessWidget {
  const UtsMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemrograman Mobile 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}