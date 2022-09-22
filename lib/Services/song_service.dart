import 'package:dio/dio.dart';
import 'package:music_app/request/request.dart';

class SongService {
  late Dio dio;

  SongService() {
    dio = Dio();
  }

  Future<void> getSongs({
    Function()? beforeSend,
    Function(Map<String, dynamic>)? onSuccess,
    Function(DioError error)? onError,
  }) async {
    ApiRequest(
      url:
          "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=8dbbbf65ba63d8e5278851222fc09948",
      body: {},
    ).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (onSuccess != null) onSuccess(data);
      },
      onError: (error) => {
        if (onError != null) onError(error),
      },
    );
  }

  Future<void> getSongById({
    required int id,
    Function()? beforeSend,
    Function(Map<String, dynamic>)? onSuccess,
    Function(DioError error)? onError,
  }) async {
    ApiRequest(
      url:
          "https://api.musixmatch.com/ws/1.1/track.get?track_id=$id&apikey=8dbbbf65ba63d8e5278851222fc09948",
      body: {},
    ).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (onSuccess != null) onSuccess(data);
      },
      onError: (error) => {
        if (onError != null) onError(error),
      },
    );
  }

  Future<void> getSongLyrics({
    required int id,
    Function()? beforeSend,
    Function(Map<String, dynamic>)? onSuccess,
    Function(DioError error)? onError,
  }) async {
    ApiRequest(
      url:
          "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=8dbbbf65ba63d8e5278851222fc09948",
      body: {},
    ).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (onSuccess != null) onSuccess(data);
      },
      onError: (error) => {
        if (onError != null) onError(error),
      },
    );
  }
}
