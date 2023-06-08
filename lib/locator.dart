import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/core/network/network_info.dart';
import 'package:music_app/core/repositories/song_storage.dart';
import 'package:music_app/features/songs/data/datasources/song_remote_datasource.dart';
import 'package:music_app/features/songs/data/repositories/song_repository_impl.dart';
import 'package:music_app/features/songs/domain/entities/song_entity.dart';
import 'package:music_app/features/songs/domain/repositories/song_repository.dart';
import 'package:music_app/features/songs/domain/usecases/get_lyrics.dart';
import 'package:music_app/features/songs/domain/usecases/get_song.dart';
import 'package:music_app/features/songs/domain/usecases/get_songs.dart';
import 'package:music_app/features/songs/presentation/bloc/song_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //! BLoC
  locator.registerFactory(
    () => SongBloc(
      getLyrics: locator(),
      getSongs: locator(),
      getSong: locator(),
      songStorageRepository: locator(),
    ),
  );

  //! UseCases
  locator.registerLazySingleton(
    () => GetLyricsUseCase(songRepository: locator()),
  );
  locator.registerLazySingleton(
    () => GetSongsUseCase(songRepository: locator()),
  );
  locator.registerLazySingleton(
    () => GetSongUseCase(songRepository: locator()),
  );

  var box = await Hive.openBox<Song>('songs');
  //! Repositories
  locator.registerLazySingleton<SongRepository>(
    () => SongRepositoryImplementation(
      networkInfo: locator(),
      remoteDataSource: locator(),
      box: box,
    ),
  );

  //! Data Source
  locator.registerLazySingleton<SongRemoteDataSource>(
    () => SongRemoteDataSourceImplementation(),
  );

  //! Core
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: locator()),
  );

  //! External Libraries
  locator.registerLazySingleton(() => Connectivity());

  //! Storage
  locator.registerLazySingleton(() => SongStorageRepository());
}
