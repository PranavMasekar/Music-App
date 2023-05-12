import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/pages/errorpage.dart';
import 'package:music_app/features/songs/presentation/bloc/song_bloc.dart';

class SongDetails extends StatefulWidget {
  final int id;
  SongDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<SongDetails> createState() => _SongDetailsState();
}

class _SongDetailsState extends State<SongDetails> {
  @override
  void initState() {
    BlocProvider.of<SongBloc>(context).add(GetDetails(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SongDetailsLoadedState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/play.jpg",
                    ),
                    Text(
                      state.song.songName,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "by ${state.song.artistName}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Lyrics",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Text(state.lyric.lyrics
                        .substring(0, state.lyric.lyrics.indexOf("***"))),
                  ],
                ),
              ),
            );
          } else if (state is SongLoadingFailure) {
            return ErrorPage(errorMessage: state.errorMsg);
          } else {
            return ErrorPage(errorMessage: "Something went wrong !!!");
          }
        },
      ),
    );
  }
}
