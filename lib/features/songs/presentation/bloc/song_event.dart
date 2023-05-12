part of 'song_bloc.dart';

abstract class SongEvent extends Equatable {}

class GetSongs extends SongEvent {
  @override
  List<Object?> get props => [];
}

// class GetLyrics extends SongEvent {
//   final int id;
//   GetLyrics({required this.id});
//   @override
//   List<Object?> get props => [id];
// }

// class GetSong extends SongEvent {
//   final int id;
//   GetSong({required this.id});
//   @override
//   List<Object?> get props => [id];
// }

class GetDetails extends SongEvent {
  final int id;
  GetDetails({required this.id});

  @override
  List<Object?> get props => [id];
}
