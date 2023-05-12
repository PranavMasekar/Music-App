part of 'song_bloc.dart';

abstract class SongState extends Equatable {}

class SongsLoadedState extends SongState {
  final List<Song> songs;
  SongsLoadedState({
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
  final String errorMsg;
  SongLoadingFailure({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}

// class SingleSongLoadedState extends SongState {
//   final Song song;
//   SingleSongLoadedState({required this.song});
//   @override
//   List<Object?> get props => [song];
// }

// class SongLyricsLoadedStae extends SongState {
//   final Lyrics lyric;
//   SongLyricsLoadedStae({required this.lyric});
//   @override
//   List<Object?> get props => [lyric];
// }

class SongDetailsLoadedState extends SongState {
  final Song song;
  final Lyrics lyric;

  SongDetailsLoadedState({required this.song, required this.lyric});
  @override
  List<Object?> get props => [song, lyric];
}
