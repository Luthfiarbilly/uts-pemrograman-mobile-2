import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../data/dummy_info_data.dart';
import '../models/info_item.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final MapController _mapController = MapController();
  InfoItem _selectedItem = dummyInfoList.first;

  void _focusLocation(InfoItem item) {
    setState(() => _selectedItem = item);
    _mapController.move(LatLng(item.latitude, item.longitude), 15);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(_selectedItem.latitude, _selectedItem.longitude),
              initialZoom: 13.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.uts_pemrograman_mobile_2',
              ),
              MarkerLayer(
                markers: dummyInfoList.map((item) {
                  final isSelected = item.id == _selectedItem.id;
                  return Marker(
                    point: LatLng(item.latitude, item.longitude),
                    width: 48,
                    height: 48,
                    child: GestureDetector(
                      onTap: () => _focusLocation(item),
                      child: Icon(
                        Icons.location_pin,
                        size: isSelected ? 46 : 36,
                        color: isSelected ? Colors.red : Colors.indigo,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: const [
              BoxShadow(blurRadius: 6, color: Colors.black12, offset: Offset(0, -2)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _selectedItem.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(_selectedItem.summary),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: dummyInfoList.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(item.title),
                        selected: item.id == _selectedItem.id,
                        onSelected: (_) => _focusLocation(item),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}