part of 'song_bloc.dart';

@immutable
abstract class SongState extends Equatable {}

class SongLoadedState extends SongState {
  final List<Song> songs;
  SongLoadedState({
    required this.songs,
  });
  @override
  List<Object?> get props => [songs];
}

class SongLoadingState extends SongState {
  @override
  List<Object?> get props => [];
}

class SongLoadingFailure extends SongState {
  @override
  List<Object?> get props => [];
}

class SingleSongLoadedState extends SongState {
  final Song song;
  SingleSongLoadedState({
    required this.song,
  });
  @override
  List<Object?> get props => [song];
}

class SongLyricsLoadedStae extends SongState {
  final Lyrics lyric;
  SongLyricsLoadedStae({
    required this.lyric,
  });
  @override
  List<Object?> get props => [lyric];
}
