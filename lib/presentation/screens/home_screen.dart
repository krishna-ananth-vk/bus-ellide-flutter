import 'package:bus_ellide_mobile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:bus_ellide_mobile/presentation/blocs/route_bloc/route_bloc.dart';
import 'package:bus_ellide_mobile/presentation/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final routeBlocProvider = ChangeNotifierProvider((ref) => RouteBloc());
final profileBlocProvider = ChangeNotifierProvider((ref) => ProfileBloc());

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeBloc = ref.watch(routeBlocProvider);
    final profileBloc = ref.watch(profileBlocProvider);
    final routes = routeBloc.routes;
    final favorites = profileBloc.favorites;
    final favoritesEntries = favorites.entries.toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SearchDropDown(
                onSearch: routeBloc.searchRoutes,
                isLoading: routeBloc.isLoading,
                results: routes,
                displayLabel: (route) => route.routeno ?? '',
                onItemClick: (route) {
                  routeBloc.selectItem(
                    route.routeno!,
                    "${route.routeparentid}",
                  );
                },
                selectedItem: (route) =>
                    favorites.containsKey(route.routeparentid),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
                child: Text(
                  'Favourite Routes',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            if (favorites.isNotEmpty)
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: favoritesEntries.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 0),
                  itemBuilder: (context, index) {
                    final anEntry = favoritesEntries[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        title: Text(anEntry.value),
                        trailing: IconButton(
                          onPressed: () => {
                            routeBloc.selectItem(
                              anEntry.value!,
                              "${anEntry.key}",
                            ),
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                        onTap: () {
                          // optional: navigate to route details or perform action
                        },
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
