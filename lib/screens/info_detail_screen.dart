import 'package:flutter/material.dart';
import '../models/info_item.dart';

class InfoDetailScreen extends StatelessWidget {
  final InfoItem item;

  const InfoDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(label: Text(item.category)),
            const SizedBox(height: 12),
            Text(
              item.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              item.summary,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const Divider(height: 28),
            Text(
              item.description,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 20),
            Text(
              'Koordinat: ${item.latitude}, ${item.longitude}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}