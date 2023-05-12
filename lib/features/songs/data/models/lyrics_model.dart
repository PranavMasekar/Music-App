import 'package:music_app/features/songs/domain/entities/lyrics_entity.dart';

class LyricsModel extends Lyrics {
  final String copyright;
  LyricsModel({
    required super.lyrics,
    required super.lyricsId,
    required this.copyright,
  });

  factory LyricsModel.fromJson(Map<String, dynamic> json) {
    return LyricsModel(
      lyrics: json["lyrics_body"],
      lyricsId: json["lyrics_id"],
      copyright: json["lyrics_copyright"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lyrics_body": lyrics,
      "lyrics_id": lyricsId,
      "lyrics_copyright": copyright,
    };
  }
}
