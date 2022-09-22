import 'package:get/get.dart';
import 'package:music_app/controllers/song_details_controller.dart';

class SongDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SongDetailsController());
  }
}
