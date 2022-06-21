class Song {
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

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      songId: json["track_id"],
      songName: json["track_name"],
      albumId: json["album_id"],
      albumName: json["album_name"],
      artistName: json["artist_name"],
    );
  }
}
