import 'package:dio/dio.dart';
import '../Services/song_service.dart';

import '../Models/song_model.dart';

class SongRepository {
  final SongService _service = SongService();

  Future<List<Song>> loadSongs() async {
    List<Song> songs = [];
    Response? response = await _service.getSongs();
    if (response == null) return [];
    Map<String, dynamic> res = response.data;
    for (var element in res["track_list"]) {
      songs.add(Song.fromJson(element));
    }
    return songs;
  }
}
