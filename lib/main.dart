import 'package:bus_ellide_mobile/core/themes/theme.dart';
import 'package:bus_ellide_mobile/injection_container.dart';
import 'package:bus_ellide_mobile/presentation/navigation/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // needed for async in main
  await initDI(); // initialize dependencies
  runApp(ProviderScope(child: BmtcApp()));
}

class BmtcApp extends StatelessWidget {
  const BmtcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMTC Live Tracker',
      theme: appTheme,
      home: const BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
