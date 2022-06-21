part of 'song_bloc.dart';

@immutable
abstract class SongState extends Equatable {}

class SongLoadedState extends SongState {
  final List<Song> songs;
  SongLoadedState({
    this.songs = const <Song>[],
  });
  @override
  List<Object?> get props => [];
}

class SongLoadingState extends SongState {
  @override
  List<Object?> get props => [];
}

class SongLoadingFailure extends SongState {
  @override
  List<Object?> get props => [];
}
