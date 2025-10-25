import 'package:bus_ellide_mobile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/services/api_client.dart';
import 'data/sources/remote/bmtc_api.dart';
import 'data/repositories/route_repository.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  await Hive.initFlutter();
  await Hive.openBox<List>('favorites');

  di.registerLazySingleton<ProfileBloc>(() => ProfileBloc());

  di.registerLazySingleton<ApiClient>(() => ApiClient());
  di.registerLazySingleton<BmtcApi>(() => BmtcApi(di<ApiClient>()));
  di.registerFactory(() => RouteRepository(di<BmtcApi>()));
}
