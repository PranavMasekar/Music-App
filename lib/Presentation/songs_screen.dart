import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Models/song_model.dart';
import 'package:music_app/Presentation/errorpage.dart';
import 'package:music_app/Presentation/song_details_page.dart';
import 'package:music_app/Repository/song_repository.dart';

import '../BLoC/song bloc/song_bloc.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoadingState)
            return Center(child: CircularProgressIndicator());
          if (state is SongLoadedState) {
            return ListView.builder(
              itemCount: context.read<SongRepository>().songs.length,
              itemBuilder: (context, index) {
                Song song = context.read<SongRepository>().songs[index];
                return ListTile(
                  style: ListTileStyle.drawer,
                  isThreeLine: false,
                  title: Text(song.songName),
                  subtitle: Text("From ${song.albumName}"),
                  leading: Image.asset("assets/images/music.png"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SongDetails(id: song.songId)),
                    );
                  },
                );
              },
            );
          } else
            return ErrorPage(errorMessage: "Something Went Wrong");
        },
      ),
    );
  }
}
