import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String? userEmail;

  const AboutScreen({super.key, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, size: 48, color: Colors.indigo),
          const SizedBox(height: 12),
          const Text(
            'Tentang Aplikasi',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Aplikasi ini dibuat untuk memenuhi tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile 2 dengan memanfaatkan Flutter dan flutter_map.',
            style: TextStyle(height: 1.5),
          ),
          const SizedBox(height: 16),
          if (userEmail != null && userEmail!.isNotEmpty)
            Text('Login sebagai: $userEmail', style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          const Divider(),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Copyright by Raden Mochammad Luthfi Arbilly Ismail Poetra_24552011074',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}