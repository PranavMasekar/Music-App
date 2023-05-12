import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/usecases/usecase.dart';
import 'package:music_app/features/songs/domain/entities/song_entity.dart';
import 'package:music_app/features/songs/domain/repositories/song_repository.dart';

class GetSongs extends UseCase<List<Song>, NoParams> {
  final SongRepository songRepository;

  GetSongs({required this.songRepository});

  @override
  Future<Either<Failure, List<Song>>> call(NoParams params) async {
    return await songRepository.getSongs();
  }
}
