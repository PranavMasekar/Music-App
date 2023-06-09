import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/locator.dart';
import 'package:music_app/models/lyrics_model.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/services/song_service.dart';

final songProvider = FutureProvider.family((ref, int id) async {
  return await locator<SongController>().getSongByID(id);
});

final lyricProvider = FutureProvider.family((ref, int id) async {
  return await locator<SongController>().getLyricsByID(id);
});

class SongController {
  final SongService _service;
  SongController({required SongService songService}) : _service = songService;

  Future<Song> getSongByID(int id) async {
    var response = await _service.getSong(id);
    late Song song;
    response.fold(
      (l) {
        throw Exception([l]);
      },
      (r) async {
        Map<String, dynamic> res = jsonDecode(r.data);
        song = Song.fromJson(res["message"]["body"]["track"]);
        log(song.songName);
        return song;
      },
    );
    return song;
  }

  Future<Lyrics?> getLyricsByID(int id) async {
    var response = await _service.getLyrics(id);
    late Lyrics lyrics;
    response.fold(
      (l) {
        throw Exception([l]);
      },
      (r) {
        Map<String, dynamic> res = jsonDecode(r.data);
        lyrics = Lyrics.fromJson(res["message"]["body"]["lyrics"]);
      },
    );
    return lyrics;
  }
}
