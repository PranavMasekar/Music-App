import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/usecases/usecase.dart';
import 'package:music_app/features/songs/domain/entities/song_entity.dart';
import 'package:music_app/features/songs/domain/repositories/song_repository.dart';

class GetSongUseCase extends UseCase<Song, SongParams> {
  final SongRepository songRepository;

  GetSongUseCase({required this.songRepository});

  @override
  Future<Either<Failure, Song>> call(SongParams params) async {
    return await songRepository.getSong(params.id);
  }
}

class SongParams extends Equatable {
  final int id;
  SongParams({required this.id});

  @override
  List<Object?> get props => [id];
}
