import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.explore_rounded,
              size: 84,
              color: colorScheme.onPrimary,
            ),
            const SizedBox(height: 16),
            Text(
              'Bandung Info & Maps',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'UTS Pemrograman Mobile 2',
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onPrimary.withValues(alpha: 0.85),
              ),
            ),
            const SizedBox(height: 32),
            CircularProgressIndicator(
              color: colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}