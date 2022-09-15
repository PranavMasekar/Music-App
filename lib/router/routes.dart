import 'package:get/get.dart';
import 'package:music_app/bindings/home_binding.dart';
import 'package:music_app/bindings/song_bindings.dart';
import 'package:music_app/router/routes_name.dart';
import 'package:music_app/view/errorpage.dart';
import 'package:music_app/view/home.dart';
import 'package:music_app/view/song_details_page.dart';
import 'package:music_app/view/songs_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.songScreen,
      page: () => SongsScreen(),
      binding: SongBinding(),
    ),
    GetPage(
      name: RoutesName.errorScreen,
      arguments: String,
      page: () => ErrorPage(errorMessage: Get.arguments),
    ),
    GetPage(
      name: RoutesName.songDetailsScreen,
      arguments: int,
      page: () => SongDetails(id: Get.arguments),
    ),
  ];
}
