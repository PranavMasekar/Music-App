part of 'song_bloc.dart';

@immutable
abstract class SongState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SongLoadedState extends SongState {}

class SongLoadingState extends SongState {}

class SongLoadingFailure extends SongState {}
