import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'info_list_screen.dart';
import 'maps_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final String userEmail;

  const MainNavigationScreen({super.key, required this.userEmail});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  static const List<String> _titles = [
    'List Informasi',
    'Flutter Maps',
    'About Aplikasi',
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      const InfoListScreen(),
      const MapsScreen(),
      AboutScreen(userEmail: widget.userEmail),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Informasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
    );
  }
}