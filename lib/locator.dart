import 'package:get_it/get_it.dart';
import 'package:music_app/router.dart';

final locator = GetIt.instance;

void setUpLocator() {
  //! SINGLETON
  locator.registerLazySingleton<AppRouter>(() => AppRouter());
}
