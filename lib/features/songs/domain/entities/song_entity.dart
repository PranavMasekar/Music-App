import 'package:equatable/equatable.dart';

class Song extends Equatable {
  final int songId;
  final String songName;
  final int albumId;
  final String albumName;
  final String artistName;

  Song({
    required this.songId,
    required this.songName,
    required this.albumId,
    required this.albumName,
    required this.artistName,
  });

  @override
  List<Object?> get props => [songId, songName, albumId, albumName, artistName];
}
