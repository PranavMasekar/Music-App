part of 'song_details_bloc.dart';

abstract class SongDetailsState extends Equatable {
  const SongDetailsState();
}

class SongDetailsLoading extends SongDetailsState {
  @override
  List<Object> get props => [];
}

class SongDetailsLoadedState extends SongDetailsState {
  final Song? song;
  final Lyrics? lyric;

  SongDetailsLoadedState({required this.song, required this.lyric});
  @override
  List<Object?> get props => [song, lyric];
}

class SongDetailsLoadingFailureState extends SongDetailsState {
  @override
  List<Object> get props => [];
}
