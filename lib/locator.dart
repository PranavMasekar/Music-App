import 'package:get_it/get_it.dart';
import 'package:music_app/controllers/home_controller.dart';
import 'package:music_app/controllers/song_controller.dart';
import 'package:music_app/router.dart';
import 'package:music_app/services/song_service.dart';

final locator = GetIt.instance;

void setUpLocator() {
  //! SINGLETON
  locator.registerSingleton<SongService>(SongService());
  locator.registerLazySingleton<AppRouter>(() => AppRouter());
  locator.registerSingleton<HomeController>(
    HomeController(songService: locator.get<SongService>()),
  );
  locator.registerLazySingleton<SongController>(
    () => SongController(songService: locator()),
  );
}
