import 'package:bus_ellide_mobile/core/themes/theme.dart';
import 'package:bus_ellide_mobile/injection_container.dart';
import 'package:bus_ellide_mobile/presentation/blocs/location_bloc/location_bloc.dart';
import 'package:bus_ellide_mobile/presentation/navigation/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(ProviderScope(child: BmtcApp()));
}

final locationBlocProvider = ChangeNotifierProvider((ref) => LocationBloc());

class BmtcApp extends ConsumerWidget {
  BmtcApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationBloc = ref.watch(locationBlocProvider);

    return MaterialApp(
      title: 'BMTC Live Tracker',
      theme: appTheme,
      home: const BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
