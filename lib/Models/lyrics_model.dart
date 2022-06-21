class Lyrics {
  int lyricsId;
  String lyrics;

  Lyrics({
    required this.lyrics,
    required this.lyricsId,
  });

  factory Lyrics.fromJson(Map<String, dynamic> json) {
    return Lyrics(
      lyrics: json["lyrics_body"],
      lyricsId: json["lyrics_id"],
    );
  }
}
