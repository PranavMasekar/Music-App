import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:music_app/common/typedef.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return left(exception.toString());
    }
  }

  FutureEither<Response> getSong(int id) async {
    try {
      String url =
          "https://api.musixmatch.com/ws/1.1/track.get?track_id=$id&apikey=8dbbbf65ba63d8e5278851222fc09948";
      final response = await dio.get(url);
      return right(response);
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return left(exception.toString());
    }
  }

  FutureEither<Response> getLyrics(int id) async {
    try {
      String url =
          "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=8dbbbf65ba63d8e5278851222fc09948";
      final response = await dio.get(url);
      return right(response);
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return left(exception.toString());
    }
  }
}
