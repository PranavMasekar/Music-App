import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/core/error/failure.dart';
import 'package:music_app/core/usecases/usecase.dart';
import 'package:music_app/features/songs/domain/entities/lyrics_entity.dart';
import 'package:music_app/features/songs/domain/entities/song_entity.dart';
import 'package:music_app/features/songs/domain/usecases/get_lyrics.dart';
import 'package:music_app/features/songs/domain/usecases/get_song.dart';
import 'package:music_app/features/songs/domain/usecases/get_songs.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetLyricsUseCase getLyrics;
  final GetSongsUseCase getSongs;
  final GetSongUseCase getSong;
  SongBloc({
    required this.getLyrics,
    required this.getSongs,
    required this.getSong,
  }) : super(SongLoadingState()) {
    on<GetSongs>(_getSongs);
    on<GetDetails>(_getDetails);
    // on<GetSong>(_getSong);
    // on<GetLyrics>(_getLyrics);
  }

  String getStringByFailure(Failure failure) {
    if (failure is ServerFailure) {
      return "Server failure";
    } else if (failure is NoInternetConnectionFailure) {
      return "No Internet Connection!!!";
    } else {
      return "Unexpected Error";
    }
  }

  Future<void> _getSongs(GetSongs event, Emitter<SongState> emit) async {
    emit(SongLoadingState());
    final result = await getSongs(NoParams());

    result.fold(
      (failure) => emit(
        SongLoadingFailure(errorMsg: getStringByFailure(failure)),
      ),
      (songs) => emit(SongsLoadedState(songs: songs)),
    );
  }

  Future<void> _getDetails(GetDetails event, Emitter<SongState> emit) async {
    emit(SongLoadingState());
    Song? song;
    Lyrics? lyrics;

    final songResult = await getSong.call(SongParams(id: event.id));
    songResult.fold(
      (failure) =>
          emit(SongLoadingFailure(errorMsg: getStringByFailure(failure))),
      (s) => song = s,
    );

    final lyricResult = await getLyrics(Params(id: event.id));
    lyricResult.fold(
      (failure) =>
          emit(SongLoadingFailure(errorMsg: getStringByFailure(failure))),
      (l) => lyrics = l,
    );

    if (song != null && lyrics != null) {
      emit(SongDetailsLoadedState(song: song!, lyric: lyrics!));
    } else {
      emit(SongLoadingFailure(errorMsg: "Unexpected Error"));
    }
  }

  // Future<void> _getSong(GetSong event, Emitter<SongState> emit) async {}

  // Future<void> _getLyrics(GetLyrics event, Emitter<SongState> emit) async {}
}
