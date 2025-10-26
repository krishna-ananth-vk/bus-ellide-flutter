import 'package:bus_ellide_mobile/presentation/blocs/map_bloc/map_bloc.dart';
import 'package:bus_ellide_mobile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:latlong2/latlong.dart';

final profileBlocProvider = ChangeNotifierProvider((ref) => ProfileBloc());
final mapBlocProvider = ChangeNotifierProvider((ref) => MapBloc());

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileBloc = ref.watch(profileBlocProvider);
    final mapBloc = ref.watch(mapBlocProvider);
    final selectedRoutes = mapBloc.selected;
    final selectedRoutePoints = mapBloc.selectedRoutePoints;
    final entries = profileBloc.entries;

    debugPrint("MapScreen is rebuilding entries_updated $entries");

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
                userAgentPackageName: 'news.nammablr.bus_elli',
              ),
              if (selectedRoutePoints.isNotEmpty)
                PolylineLayer(
                  polylines: selectedRoutePoints.entries.map((entry) {
                    final points = entry.value
                        .map(
                          (point) => LatLng(
                            double.tryParse(point.latitude ?? '') ?? 0,
                            double.tryParse(point.longitude ?? '') ?? 0,
                          ),
                        )
                        .toList();
                    return Polyline(
                      points: points,
                      color: Colors.blue, // optionally vary color per route
                      strokeWidth: 4,
                    );
                  }).toList(),
                ),
            ],
          ),
          if (entries.isNotEmpty)
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
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final route = entries[index];
                      final selected = selectedRoutes.contains(route.key);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(route.value),
                          selected: selected,
                          onSelected: (_) => mapBloc.toggleSelected(route.key),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

          if (entries.isEmpty)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0, // just above bottom navigation
              child: Container(
                color: Colors.white.withOpacity(0.9),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text("No Favorites", textAlign: TextAlign.center),
              ),
            ),
        ],
      ),
    );
  }
}
