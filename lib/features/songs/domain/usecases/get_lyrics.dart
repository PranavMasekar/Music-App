import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/usecases/usecase.dart';
import 'package:music_app/features/songs/domain/entities/lyrics_entity.dart';
import 'package:music_app/features/songs/domain/repositories/song_repository.dart';

class GetLyrics extends UseCase<Lyrics, Params> {
  final SongRepository songRepository;

  GetLyrics({required this.songRepository});

  @override
  Future<Either<Failure, Lyrics>> call(Params params) async {
    return await songRepository.getLyrics(params.id);
  }
}

class Params extends Equatable {
  final int id;
  Params({required this.id});

  @override
  List<Object?> get props => [id];
}
