import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:music_app/Models/lyrics_model.dart';
import '../Services/song_service.dart';

import '../Models/song_model.dart';

class SongRepository {
  final SongService _service = SongService();

  Future<List<Song>> loadSongs() async {
    List<Song> songs = [];
    Response? response = await _service.getSongs();
    if (response == null) return [];
    Map<String, dynamic> res = jsonDecode(response.data);
    for (var element in res["message"]["body"]["track_list"]) {
      songs.add(Song.fromJson(element["track"]));
    }
    return songs;
  }

  Future<Song?> getSong(int id) async {
    Song song;
    Response? response = await _service.getSong(id);
    if (response == null) return null;
    Map<String, dynamic> res = jsonDecode(response.data);
    song = Song.fromJson(res["message"]["body"]["track"]);
    return song;
  }

  Future<Lyrics?> getLyrics(int id) async {
    Lyrics lyric;
    Response? response = await _service.getLyrics(id);
    if (response == null) return null;
    Map<String, dynamic> res = jsonDecode(response.data);
    lyric = Lyrics.fromJson(res["message"]["body"]["lyrics"]);
    return lyric;
  }
}
