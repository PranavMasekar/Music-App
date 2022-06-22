part of 'song_details_bloc.dart';

abstract class SongDetailsEvent extends Equatable {
  const SongDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetDetails extends SongDetailsEvent {
  final Song song;
  final Lyrics lyric;
  final int id;
  GetDetails({required this.lyric, required this.song, required this.id});
}
