import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/core/error/exceptions.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/network/network_info.dart';
import 'package:music_app/features/songs/data/datasources/song_remote_datasource.dart';
import 'package:music_app/features/songs/data/models/song_model.dart';
import 'package:music_app/features/songs/domain/entities/lyrics_entity.dart';
import 'package:music_app/features/songs/domain/entities/song_entity.dart';
import 'package:music_app/features/songs/domain/repositories/song_repository.dart';

class SongRepositoryImplementation extends SongRepository {
  final SongRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final Box<Song> box;

  SongRepositoryImplementation({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.box,
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
        for (SongModel song in songs) {
          box.put(song.songId, song);
        }
        log("Returned from Remote Datasource");
        return right(songs);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      List<Song> songs = box.values.cast<Song>().toList();
      log("Returned from Hive Datasource");
      return right(songs);
      // return left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Song>> getSong(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final song = await remoteDataSource.getSong(id);
        return right(song);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetConnectionFailure());
    }
  }
}
