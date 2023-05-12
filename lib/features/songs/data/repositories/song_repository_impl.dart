import 'package:fpdart/fpdart.dart';
import 'package:music_app/core/error/exceptions.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/network/network_info.dart';
import 'package:music_app/features/songs/data/datasources/song_remote_datasource.dart';
import 'package:music_app/features/songs/domain/entities/lyrics_entity.dart';
import 'package:music_app/features/songs/domain/entities/song_entity.dart';
import 'package:music_app/features/songs/domain/repositories/song_repository.dart';

class SongRepositoryImplementation extends SongRepository {
  final SongRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SongRepositoryImplementation({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Lyrics>> getLyrics(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final lyrics = await remoteDataSource.getLyrics(id);
        return right(lyrics);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Song>>> getSongs() async {
    if (await networkInfo.isConnected) {
      try {
        final songs = await remoteDataSource.getSongs();
        return right(songs);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetConnectionFailure());
    }
  }
}
