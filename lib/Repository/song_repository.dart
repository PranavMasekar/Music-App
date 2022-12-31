import 'dart:convert';

import 'package:dio/dio.dart';
import '../Services/song_service.dart';

import '../Models/song_model.dart';

class SongRepository {
  final SongService _service = SongService();
  List<Song> songs = [];

  Future<void> loadSongs() async {
    Response? response = await _service.getSongs();
    if (response == null) return;
    songs.clear();
    Map<String, dynamic> res = jsonDecode(response.data);
    for (var element in res["message"]["body"]["track_list"]) {
      songs.add(Song.fromJson(element["track"]));
    }
  }

  String getSongNameByID(int id) {
    for (Song song in songs) {
      if (song.songId == id) return song.songName;
    }
    return "";
  }

  String getArtistNameByID(int id) {
    for (Song song in songs) {
      if (song.songId == id) return song.artistName;
    }
    return "";
  }
}
