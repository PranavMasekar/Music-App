import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Presentation/errorpage.dart';

import '../BLoC/song details bloc/song_details_bloc.dart';
import '../Models/lyrics_model.dart';
import '../Models/song_model.dart';

class SongDetails extends StatelessWidget {
  final int id;
  SongDetails({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => SongDetailsBloc()
          ..add(
            GetDetails(
              lyric: Lyrics(lyrics: "0", lyricsId: 0),
              song: Song(
                  songId: 0,
                  songName: "0",
                  albumId: 0,
                  albumName: "0",
                  artistName: "0"),
              id: id,
            ),
          )),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Music App"),
          ),
          body: Builder(
            builder: ((context) {
              return BlocBuilder<SongDetailsBloc, SongDetailsState>(
                builder: (context, state) {
                  if (state is SongDetailsLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is SongDetailsLoadedState) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/music.png",
                              height: 250,
                              width: 250,
                            ),
                            Text(
                              state.song!.songName,
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              "by ${state.song!.artistName}",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Lyrics",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Text(state.lyric!.lyrics),
                          ],
                        ),
                      ),
                    );
                  }
                  return ErrorPage(errorMessage: "Something Went Wrong");
                },
              );
            }),
          ),
        ));
  }
}
