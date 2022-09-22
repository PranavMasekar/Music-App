import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:music_app/Services/song_service.dart';
import 'package:music_app/models/lyrics_model.dart';
import '../models/song_model.dart';

class SongDetailsController extends GetxController {
  final SongService _service = SongService();
  int id = 0;
  RxBool isLoading = false.obs;
  Lyrics? lyric;
  Song? song;

  set setId(int id) => this.id = id;

  Future<void> getSongLyrics() async {
    isLoading.value = true;
    await _service.getSongLyrics(
      id: id,
      beforeSend: () {},
      onSuccess: (res) {
        lyric = Lyrics.fromJson(res);
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
    log("Executed GetLyrics");
  }

  Future<void> getSongById() async {
    await _service.getSongById(
      id: id,
      beforeSend: () {},
      onSuccess: (res) {
        song = Song.fromJson(res);
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
    log("Executed GetSongById");
  }

  @override
  void onInit() {
    log(id.toString());
    getSongById();
    getSongLyrics();
    super.onInit();
  }
}
