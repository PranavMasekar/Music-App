import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Presentation/errorpage.dart';
import 'package:music_app/Presentation/song_details_page.dart';

import '../BLoC/song bloc/song_bloc.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoadingState)
            return Center(child: CircularProgressIndicator());
          if (state is SongLoadedState) {
            return ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  style: ListTileStyle.drawer,
                  isThreeLine: false,
                  title: Text(state.songs[index].songName),
                  subtitle: Text("From ${state.songs[index].albumName}"),
                  trailing: Text("By ${state.songs[index].artistName}"),
                  leading: Image.asset("assets/images/music.png"),
                  onTap: () {
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
          } else
            return ErrorPage(errorMessage: "Something Went Wrong");
        },
      ),
    );
  }
}
