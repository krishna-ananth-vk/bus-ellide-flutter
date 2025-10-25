import 'package:get_it/get_it.dart';
import 'core/services/api_client.dart';
import 'data/sources/remote/bmtc_api.dart';
import 'data/repositories/route_repository.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  di.registerLazySingleton<ApiClient>(() => ApiClient());
  di.registerLazySingleton<BmtcApi>(() => BmtcApi(di<ApiClient>()));
  di.registerFactory(() => RouteRepository(di<BmtcApi>()));
}
