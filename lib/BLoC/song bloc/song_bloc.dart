import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../Repository/song_repository.dart';

import '../../Models/song_model.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc() : super(SongLoadingState()) {
    on<GetSongs>(_getSongs);
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
}
