import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../Repository/song_repository.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final SongRepository _repository;
  SongBloc({required SongRepository songRepository})
      : _repository = songRepository,
        super(SongLoadingState()) {
    on<GetSongs>(_getSongs);
  }

  Future<void> _getSongs(GetSongs event, Emitter<SongState> emit) async {
    emit(SongLoadingState());
    try {
      await _repository.loadSongs();
      emit(SongLoadedState());
    } catch (e) {
      log(e.toString());
      emit(SongLoadingFailure());
    }
  }
}
