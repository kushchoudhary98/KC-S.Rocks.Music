import 'package:get_it/get_it.dart';
import 'package:s_rocks_music/services/home_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<HomeService>(() => HomeService());
}
