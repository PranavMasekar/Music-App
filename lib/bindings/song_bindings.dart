import 'package:get/get.dart';
import 'package:music_app/controllers/song_controller.dart';

class SongBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SongController());
  }
}
