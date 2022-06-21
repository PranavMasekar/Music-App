import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Models/lyrics_model.dart';
import 'package:music_app/Models/song_model.dart';
import 'package:music_app/Presentation/song_details_page.dart';

import '../BLoC/song bloc/song_bloc.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
      ),
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoadedState) {
            print(state.songs.length.toString());
          }
          return Center(
            child: TextButton(
              onPressed: () async {
                SongBloc().add(
                  GetSong(
                    song: Song(
                      songId: 0,
                      songName: "0",
                      albumId: 0,
                      albumName: "0",
                      artistName: "0",
                    ),
                    id: 0,
                  ),
                );
                SongBloc().add(
                  GetLyrics(
                    lyric: Lyrics(
                      lyrics: "0",
                      lyricsId: 0,
                    ),
                    id: 0,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => SongDetails(id: 1)),
                  ),
                );
              },
              child: Text("Home Screen"),
            ),
          );
        },
      ),
    );
  }
}
