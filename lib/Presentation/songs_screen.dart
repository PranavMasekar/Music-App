import 'package:flutter/material.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListTile(
            style: ListTileStyle.drawer,
            isThreeLine: false,
            title: Text("state.songs[index].songName"),
            subtitle: Text("From }"),
            trailing: Text("By "),
            leading: Image.asset("assets/images/music.png"),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: ((context) =>
              //         SongDetails(id: state.songs[index].songId)),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
