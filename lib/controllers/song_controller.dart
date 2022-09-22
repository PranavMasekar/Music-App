import 'package:dio/dio.dart';
import 'package:music_app/Services/song_service.dart';
import 'package:music_app/models/song_model.dart';
import 'package:get/get.dart';

class SongController extends GetxController {
  final SongService _service = SongService();
  RxBool isLoading = false.obs;
  List<Song> songs = [];
  Future<void> getSongs() async {
    isLoading.value = true;
    await _service.getSongs(
      beforeSend: () {},
      onSuccess: (res) {
        for (var element in res["message"]["body"]["track_list"]) {
          songs.add(Song.fromJson(element["track"]));
        }
        isLoading.value = false;
        update();
      },
      onError: (err) {
        isLoading.value = false;
        if (err.type == DioErrorType.response) {
          Get.snackbar("Error", err.response!.data['message']);
        }
      },
    );
    update();
  }

  @override
  void onInit() async {
    getSongs();
    super.onInit();
  }
}
