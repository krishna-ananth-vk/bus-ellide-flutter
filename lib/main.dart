import 'package:bus_ellide_mobile/core/themes/theme.dart';
import 'package:bus_ellide_mobile/features/home/home.dart';
import 'package:bus_ellide_mobile/features/route_details/live_tracking_page.dart';
import 'package:bus_ellide_mobile/features/route_details/route_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: BMTCApp()));
}

class BMTCApp extends StatelessWidget {
  const BMTCApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (c, s) => const HomePage()),
        GoRoute(
          path: '/route/:id',
          builder: (c, s) => RouteDetailsPage(routeId: '1000' ?? 'unknown'),
        ),
        GoRoute(
          path: '/live/:id',
          builder: (c, s) => LiveTrackingPage(routeId: '300' ?? 'unknown'),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'BMTC — Starter',
      theme: neubrutalTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
