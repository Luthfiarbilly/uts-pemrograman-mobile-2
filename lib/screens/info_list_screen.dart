import 'package:flutter/material.dart';
import '../data/dummy_info_data.dart';
import 'info_detail_screen.dart';

class InfoListScreen extends StatelessWidget {
  const InfoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: dummyInfoList.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = dummyInfoList[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.place_outlined, color: Colors.indigo),
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              item.summary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => InfoDetailScreen(item: item),
                ),
              );
            },
          ),
        );
      },
    );
  }
}