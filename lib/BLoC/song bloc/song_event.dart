part of 'song_bloc.dart';

@immutable
abstract class SongEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSongs extends SongEvent {}
