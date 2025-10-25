import 'package:bus_ellide_mobile/presentation/blocs/route_bloc/route_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final routeBlocProvider = ChangeNotifierProvider((ref) => RouteBloc());

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeBloc = ref.watch(routeBlocProvider);
    final routes = routeBloc.routes;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search routes...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  routeBloc.searchRoutes(value);
                },
              ),
            ),
            if (routeBloc.isLoading) const LinearProgressIndicator(),
            // Dropdown suggestions
            if (routes.isNotEmpty)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                constraints: const BoxConstraints(maxHeight: 300),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: routes.length,
                  itemBuilder: (context, index) {
                    final route = routes[index];
                    return ListTile(
                      title: Text(route.routeno ?? ''),
                      subtitle: Text('Route ID: ${route.routeno}'),
                      onTap: () {
                        // Fill the TextField or navigate
                        // routeBloc.selectRoute(route);
                      },
                    );
                  },
                ),
              ),
            if (routes.isEmpty && !routeBloc.isLoading)
              const Expanded(child: Center(child: Text('No results'))),
          ],
        ),
      ),
    );
  }
}
