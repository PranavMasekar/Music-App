import 'package:music_app/features/songs/domain/entities/lyrics_entity.dart';
import 'package:music_app/features/songs/domain/entities/song_entity.dart';

class SongStorageRepository {
  List<Song> songs = [];
  Song? currentSong;
  Lyrics? currentLyrics;

  void setCurrentSong(Song song) => currentSong = song;

  void setCurrentLyrics(Lyrics lyrics) => currentLyrics = lyrics;

  void setCurrentSongs(List<Song> songs) => this.songs = songs;
}
