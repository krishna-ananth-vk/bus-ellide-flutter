import 'package:bus_ellide_mobile/core/widgets/neubrutal_card.dart';
import 'package:flutter/material.dart';

class LiveTrackingPage extends StatefulWidget {
  final String routeId;
  const LiveTrackingPage({required this.routeId, super.key});

  @override
  State<LiveTrackingPage> createState() => _LiveTrackingPageState();
}

class _LiveTrackingPageState extends State<LiveTrackingPage> {
  final _buses = List.generate(
    4,
    (i) => {
      'id': 'bus_${i + 1}',
      'eta': '${3 + i} min',
      'pos': 'near stop ${i + 1}',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live — ${widget.routeId}')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            NeubrutalCard(
              child: SizedBox(
                height: 140,
                child: Center(child: Text('Live map placeholder')),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _buses.length,
                itemBuilder: (context, i) {
                  final b = _buses[i];
                  return NeubrutalCard(
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${i + 1}')),
                      title: Text('Bus ${b['id']}'),
                      subtitle: Text('${b['pos']}'),
                      trailing: Text('${b['eta']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
