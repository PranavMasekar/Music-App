  // Future<Song?> getSong(int id) async {
  //   Song song;
  //   Response? response = await _service.getSong(id);
  //   if (response == null) return null;
  //   Map<String, dynamic> res = jsonDecode(response.data);
  //   song = Song.fromJson(res["message"]["body"]["track"]);
  //   return song;
  // }

  // Future<Lyrics?> getLyrics(int id) async {
  //   Lyrics lyric;
  //   Response? response = await _service.getLyrics(id);
  //   if (response == null) return null;
  //   Map<String, dynamic> res = jsonDecode(response.data);
  //   lyric = Lyrics.fromJson(res["message"]["body"]["lyrics"]);
  //   return lyric;
  // }
