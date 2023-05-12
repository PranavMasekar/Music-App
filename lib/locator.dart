import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:music_app/core/network/network_info.dart';
import 'package:music_app/features/songs/data/datasources/song_remote_datasource.dart';
import 'package:music_app/features/songs/data/repositories/song_repository_impl.dart';
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

  //! Repositories
  locator.registerLazySingleton(
    () => SongRepositoryImplementation(
      networkInfo: locator(),
      remoteDataSource: locator(),
    ),
  );

  //! Data Source
  locator.registerLazySingleton(() => SongRemoteDataSourceImplementation());

  //! Core
  locator.registerLazySingleton(() => NetworkInfoImpl(connectivity: locator()));

  //! External Libraries
  locator.registerLazySingleton(() => Connectivity());
}
