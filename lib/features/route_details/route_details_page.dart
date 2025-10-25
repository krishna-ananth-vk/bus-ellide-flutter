import 'package:bus_ellide_mobile/core/widgets/neubrutal_card.dart';
import 'package:flutter/material.dart';

class RouteDetailsPage extends StatelessWidget {
  final String routeId;
  const RouteDetailsPage({required this.routeId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Route $routeId')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            NeubrutalCard(
              child: SizedBox(
                height: 160,
                child: Center(child: Text('Map / Polyline placeholder')),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, idx) {
                  return NeubrutalCard(
                    child: ListTile(
                      title: Text('Stop ${idx + 1}'),
                      subtitle: const Text('Sample stop name'),
                      trailing: Text('${(idx + 1) * 2} min'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
