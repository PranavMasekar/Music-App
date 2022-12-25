import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/locator.dart';
import 'package:music_app/models/lyrics_model.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/services/song_service.dart';

final songAndLyricProvider = FutureProvider.family((ref, int id) async {
  final songController = ref.read(songControllerProvider.notifier);
  return songController.getSongByID(id);
});

final lyricProvider = StateProvider<Lyrics?>((ref) {
  return null;
});

final songControllerProvider =
    StateNotifierProvider<SongController, bool>((ref) {
  return SongController(songService: locator.get<SongService>(), ref: ref);
});

class SongController extends StateNotifier<bool> {
  final SongService _service;
  final Ref _ref;

  SongController({required SongService songService, required Ref ref})
      : _service = songService,
        _ref = ref,
        super(false);

  Lyrics? lyric;
  Future<Song?> getSongByID(int id) async {
    // await getLyricsByID(id);
    var response = await _service.getSong(id);

    Song? song;
    response.fold(
      (l) {
        throw l;
      },
      (r) async {
        Map<String, dynamic> res = jsonDecode(r.data);
        song = Song.fromJson(res["message"]["body"]["track"]);
        await getLyricsByID(id);
      },
    );
    return song;
  }

  Future<void> getLyricsByID(int id) async {
    var response = await _service.getLyrics(id);
    state = false;
    response.fold(
      (l) {
        throw l;
      },
      (r) {
        Map<String, dynamic> res = jsonDecode(r.data);
        lyric = Lyrics.fromJson(res["message"]["body"]["lyrics"]);
        _ref.read(lyricProvider.notifier).update((state) => lyric);
      },
    );
  }
}
