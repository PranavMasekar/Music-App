import 'package:music_app/features/songs/domain/entities/song_entity.dart';

class SongModel extends Song {
  final int artistId;
  final int songRating;
  SongModel({
    required super.songId,
    required super.songName,
    required super.albumId,
    required super.albumName,
    required super.artistName,
    required this.artistId,
    required this.songRating,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      songId: json["track_id"],
      songName: json["track_name"],
      albumId: json["album_id"],
      albumName: json["album_name"],
      artistName: json["artist_name"],
      artistId: json["artist_id"],
      songRating: json["track_rating"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "track_id": songId,
      "track_name": songName,
      "album_id": albumId,
      "album_name": albumName,
      "artist_id": artistId,
      "artist_name": artistName,
      "track_rating": songRating,
    };
  }
}
