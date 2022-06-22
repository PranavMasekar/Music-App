import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Presentation/errorpage.dart';
import 'package:music_app/Models/lyrics_model.dart';
import 'package:music_app/Models/song_model.dart';
import 'package:music_app/Presentation/song_details_page.dart';

import '../BLoC/song bloc/song_bloc.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fetchSongAndLyrics(int id) async {
      SongBloc().add(
        GetSong(
          song: Song(
            songId: 0,
            songName: "0",
            albumId: 0,
            albumName: "0",
            artistName: "0",
          ),
          id: id,
        ),
      );
      SongBloc().add(
        GetLyrics(
          lyric: Lyrics(
            lyrics: "0",
            lyricsId: 0,
          ),
          id: id,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
      ),
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is SongLoadedState) {
            return ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.songs[index].songName),
                  subtitle: Text("From ${state.songs[index].albumName}"),
                  trailing: Text("By ${state.songs[index].artistName}"),
                  onTap: () {
                    // fetchSongAndLyrics(state.songs[index].songId).then(
                    //   (value) => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: ((context) =>
                    //           SongDetails(id: state.songs[index].songId)),
                    //     ),
                    //   ),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            SongDetails(id: state.songs[index].songId)),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return ErrorPage(errorMessage: "Something Went Wrong");
          }
        },
      ),
    );
  }
}
