part of 'song_bloc.dart';

@immutable
abstract class SongEvent extends Equatable {}

class GetSongs extends SongEvent {
  final List<Song> songs;
  GetSongs({required this.songs});
  @override
  List<Object?> get props => [];
}
