part of 'song_bloc.dart';

@immutable
abstract class SongEvent extends Equatable {}

class GetSongs extends SongEvent {
  final List<Song> songs;
  GetSongs({required this.songs});
  @override
  List<Object?> get props => [songs];
}

class GetLyrics extends SongEvent {
  final Lyrics lyric;
  final int id;
  GetLyrics({required this.lyric, required this.id});
  @override
  List<Object?> get props => [lyric];
}

class GetSong extends SongEvent {
  final Song song;
  final int id;
  GetSong({required this.song, required this.id});
  @override
  List<Object?> get props => [song];
}
