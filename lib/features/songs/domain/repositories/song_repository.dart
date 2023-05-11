import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/songs/domain/entities/lyrics_entity.dart';
import 'package:music_app/features/songs/domain/entities/song_entity.dart';

abstract class SongRepository {
  Future<Either<Failure, List<Song>>> getSongs();
  Future<Either<Failure, Lyrics>> getLyrics(int id);
}
