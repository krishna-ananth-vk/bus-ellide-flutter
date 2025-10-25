import 'package:bus_ellide_mobile/core/models/route_model.dart';
import 'package:bus_ellide_mobile/core/widgets/neubrutal_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<RouteModel> _mockRoutes = [
  RouteModel(
    id: 'r1',
    number: '500A',
    name: 'Magadi Road - Majestic',
    stops: [],
  ),
  RouteModel(id: 'r2', number: '200', name: 'KR Puram - Silk Board', stops: []),
  RouteModel(id: 'r3', number: '276', name: 'City Circle', stops: []),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _mockRoutes
        .where(
          (r) =>
              r.number.contains(_query) ||
              r.name.toLowerCase().contains(_query.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('nammaBus')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            NeubrutalCard(
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search route or stop',
                      ),
                      onChanged: (v) => setState(() => _query = v),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, idx) {
                  final r = filtered[idx];
                  return GestureDetector(
                    onTap: () => context.push('/route/${r.id}'),
                    child: NeubrutalCard(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFFFFFFF),
                              border: Border.all(
                                color: const Color(0xFFBFC9D9),
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              r.number,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              r.name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          IconButton(
                            onPressed: () => context.go('/live/${r.id}'),
                            icon: const Icon(Icons.directions_bus),
                          ),
                        ],
                      ),
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
