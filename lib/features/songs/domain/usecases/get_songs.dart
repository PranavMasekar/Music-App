import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/features/songs/domain/entities/song_entity.dart';
import 'package:music_app/features/songs/domain/repositories/song_repository.dart';

class GetSongs {
  final SongRepository songRepository;

  GetSongs({required this.songRepository});

  Future<Either<Failure, List<Song>>> execute() async {
    return await songRepository.getSongs();
  }
}
