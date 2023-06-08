import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'song_entity.g.dart';

@HiveType(typeId: 0)
class Song extends Equatable {
  @HiveField(0)
  final int songId;
  @HiveField(1)
  final String songName;
  @HiveField(2)
  final int albumId;
  @HiveField(3)
  final String albumName;
  @HiveField(4)
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
