import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/locator.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/services/song_service.dart';

final songsProvider = FutureProvider((ref) async {
  return await locator<HomeController>().loadSongs();
});

class HomeController {
  final SongService _service;
  HomeController({required SongService songService}) : _service = songService;
  List<Song> allSongs = [];

  Future<List<Song>> loadSongs() async {
    final response = await _service.getSongs();
    response.fold(
      (l) {
        throw Exception([l]);
      },
      (r) {
        allSongs.clear();
        Map<String, dynamic> res = jsonDecode(r.data);
        for (var element in res["message"]["body"]["track_list"]) {
          allSongs.add(Song.fromJson(element["track"]));
        }
      },
    );
    return allSongs;
  }
}
