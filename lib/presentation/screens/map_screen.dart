import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Map<String, String>> favoriteRoutes = [
    {'id': '201R', 'name': '201R'},
    {'id': '500C', 'name': '500C'},
    {'id': 'KBS1', 'name': 'KBS1'},
    {'id': 'V500D', 'name': 'V500D'},
    {'id': 'V365', 'name': 'V365'},
  ];

  final Set<String> selectedRoutes = {};

  void toggleRoute(String id) {
    setState(() {
      if (selectedRoutes.contains(id)) {
        selectedRoutes.remove(id);
      } else {
        selectedRoutes.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(12.9716, 77.5946),
              initialZoom: 12.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.bmtcapp',
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0, // just above bottom navigation
            child: Container(
              color: Colors.white.withOpacity(0.9),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: favoriteRoutes.length,
                  itemBuilder: (context, index) {
                    final route = favoriteRoutes[index];
                    final selected = selectedRoutes.contains(route['id']);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text(route['name']!),
                        selected: selected,
                        onSelected: (_) => toggleRoute(route['id']!),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
