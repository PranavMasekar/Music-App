import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:music_app/common/typedef.dart';

class SongService {
  late Dio dio;

  SongService() {
    dio = Dio();
  }

  FutureEither<Response> getSongs() async {
    try {
      String url =
          "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=8dbbbf65ba63d8e5278851222fc09948";
      final Response response = await dio.get(url);
      if (response.statusCode == 200)
        return right(response);
      else
        throw "Something went wrong";
    } on DioError catch (e) {
      return left("");
    } catch (e) {
      return left(e.toString());
    }
  }

  FutureEither<Response> getSong(int id) async {
    try {
      String url =
          "https://api.musixmatch.com/ws/1.1/track.get?track_id=$id&apikey=8dbbbf65ba63d8e5278851222fc09948";
      final response = await dio.get(url);
      return right(response);
    } on DioError catch (e) {
      debugPrint("Status Code : ${e.response!.statusCode.toString()}");
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  FutureEither<Response> getLyrics(int id) async {
    try {
      String url =
          "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=8dbbbf65ba63d8e5278851222fc09948";
      final response = await dio.get(url);
      return right(response);
    } on DioError catch (e) {
      debugPrint("Status Code $e");
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}
