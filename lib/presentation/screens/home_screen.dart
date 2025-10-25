import 'package:bus_ellide_mobile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:bus_ellide_mobile/presentation/blocs/route_bloc/route_bloc.dart';
import 'package:bus_ellide_mobile/presentation/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final routeBlocProvider = ChangeNotifierProvider((ref) => RouteBloc());
final profileBlocProvider = ChangeNotifierProvider((ref) => ProfileBloc());

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeBloc = ref.watch(routeBlocProvider);
    final profileBloc = ref.watch(profileBlocProvider);
    final routes = routeBloc.routes;
    final favorites = profileBloc.favorites;

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
                  routeBloc.selectItem(route.routeno);
                },
                selectedItem: (route) => favorites.contains(route.routeno),
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
                  itemCount: favorites.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 0),
                  itemBuilder: (context, index) {
                    final routeNo = favorites[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        title: Text(routeNo),
                        trailing: Icon(Icons.star, color: Colors.amber),
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
