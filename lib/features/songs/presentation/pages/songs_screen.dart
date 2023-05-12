import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/pages/errorpage.dart';
import 'package:music_app/core/repositories/song_storage.dart';
import 'package:music_app/features/songs/presentation/bloc/song_bloc.dart';
import 'package:music_app/locator.dart';

import 'song_details_page.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  @override
  void initState() {
    BlocProvider.of<SongBloc>(context).add(GetSongs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SongLoadingFailure) {
            return ErrorPage(errorMessage: state.errorMsg);
          }
          return ListView.builder(
            itemCount: locator<SongStorageRepository>().songs.length,
            itemBuilder: (context, index) {
              return ListTile(
                style: ListTileStyle.drawer,
                isThreeLine: false,
                title: Text(
                    locator<SongStorageRepository>().songs[index].songName),
                subtitle: Text(
                    "From ${locator<SongStorageRepository>().songs[index].albumName}"),
                // trailing: Text("By ${state.songs[index].artistName}"),
                leading: Image.asset("assets/images/music.png"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => SongDetails(
                          id: locator<SongStorageRepository>()
                              .songs[index]
                              .songId)),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
