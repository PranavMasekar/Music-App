import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SongService {
  late Dio dio;

  SongService() {
    dio = Dio();
  }

  Future getSongs() async {
    try {
      String url =
          "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=8dbbbf65ba63d8e5278851222fc09948";
      final response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      debugPrint("Status Code : ${e.response!.statusCode.toString()}");
    }
  }

  Future getSong(int id) async {
    try {
      String url =
          "https://api.musixmatch.com/ws/1.1/track.get?track_id=$id&apikey=8dbbbf65ba63d8e5278851222fc09948";
      final response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      debugPrint("Status Code : ${e.response!.statusCode.toString()}");
    }
  }

  Future getLyrics(int id) async {
    try {
      String url =
          "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=8dbbbf65ba63d8e5278851222fc09948";
      final response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      debugPrint("Status Code $e");
    }
  }
}
