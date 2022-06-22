import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/lyrics_model.dart';
import '../../Models/song_model.dart';
import '../../Repository/song_repository.dart';

part 'song_details_event.dart';
part 'song_details_state.dart';

class SongDetailsBloc extends Bloc<SongDetailsEvent, SongDetailsState> {
  final SongRepository _repository = SongRepository();
  SongDetailsBloc() : super(SongDetailsLoading()) {
    on<GetDetails>(
      (event, emit) async {
        Song? song;
        song = await _repository.getSong(event.id);
        Lyrics? lyric;
        lyric = await _repository.getLyrics(event.id);
        if (song == null && lyric == null) {
          emit(SongDetailsLoadingFailureState());
        } else {
          emit(SongDetailsLoadedState(song: song, lyric: lyric));
        }
      },
    );
  }
}
