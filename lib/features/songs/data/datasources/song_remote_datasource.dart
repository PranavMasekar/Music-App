import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:music_app/core/error/exceptions.dart';
import 'package:music_app/features/songs/data/models/lyrics_model.dart';
import 'package:music_app/features/songs/data/models/song_model.dart';

abstract class SongRemoteDataSource {
  Future<LyricsModel> getLyrics(int id);
  Future<List<SongModel>> getSongs();
}

class SongRemoteDataSourceImplementation extends SongRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<LyricsModel> getLyrics(int id) async {
    String url =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=8dbbbf65ba63d8e5278851222fc09948";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.data);
      return LyricsModel.fromJson(res["message"]["body"]["lyrics"]);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SongModel>> getSongs() async {
    String url =
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=8dbbbf65ba63d8e5278851222fc09948";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.data);

      List<SongModel> songs = [];
      for (var element in res["message"]["body"]["track_list"]) {
        songs.add(SongModel.fromJson(element["track"]));
      }
      return songs;
    } else {
      throw ServerException();
    }
  }
}
