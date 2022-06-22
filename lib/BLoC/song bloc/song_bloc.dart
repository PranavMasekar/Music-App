import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../Models/lyrics_model.dart';
import '../../Repository/song_repository.dart';

import '../../Models/song_model.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc() : super(SongLoadingState()) {
    on<GetSongs>(_getSongs);
    on<GetSong>(_getSong);
    on<GetLyrics>(_getLyrics);
  }

  final SongRepository _repository = SongRepository();

  Future<void> _getSongs(GetSongs event, Emitter<SongState> emit) async {
    List<Song> songs = [];
    songs = await _repository.loadSongs();
    if (songs == []) {
      emit(SongLoadingFailure());
    } else {
      emit(SongLoadedState(songs: songs));
    }
  }

  Future<void> _getSong(GetSong event, Emitter<SongState> emit) async {
    Song? song;
    song = await _repository.getSong(event.id);
    if (song == null) {
      emit(SongLoadingFailure());
    } else {
      emit(SingleSongLoadedState(song: song));
    }
  }

  Future<void> _getLyrics(GetLyrics event, Emitter<SongState> emit) async {
    emit(SongLoadingState());
    Lyrics? lyric;
    lyric = await _repository.getLyrics(event.id);
    if (lyric == null) {
      emit(SongLoadingFailure());
    } else {
      emit(SongLyricsLoadedStae(lyric: lyric));
    }
  }
}
