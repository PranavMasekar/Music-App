
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/common/loader.dart';
import 'package:music_app/controllers/home_controller.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/route_names.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeControllerProvider.notifier).loadSongs(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: ref.watch(homeControllerProvider)
          ? Loader()
          : ListView.builder(
              itemCount:
                  ref.watch(homeControllerProvider.notifier).allSongs.length,
              itemBuilder: (context, index) {
                Song song =
                    ref.watch(homeControllerProvider.notifier).allSongs[index];
                return ListTile(
                  style: ListTileStyle.drawer,
                  isThreeLine: false,
                  title: Text(song.songName),
                  subtitle: Text("From ${song.albumName}"),
                  leading: Image.asset("assets/images/music.png"),
                  onTap: () {
                    context.goNamed(
                      RouteNames.songDetail,
                      params: {
                        "id": song.songId.toString(),
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}
