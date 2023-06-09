import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/common/loader.dart';
import 'package:music_app/controllers/song_controller.dart';

class SongDetails extends ConsumerWidget {
  final int id;
  SongDetails({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ref.watch(songProvider(id)).when(
                    data: (data) {
                      return Column(
                        children: [
                          Image.asset("assets/images/play.jpg"),
                          Text(
                            data.songName,
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            "by ${data.artistName}",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Lyrics",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          ref.watch(lyricProvider(id)).when(
                            data: (data) {
                              if (data == null) {
                                return Text("NO LYRICS");
                              } else {
                                return Text(
                                  data.lyrics
                                      .substring(data.lyrics.indexOf("***")),
                                );
                              }
                            },
                            error: (error, stackTrace) {
                              return Text("NO LYRICS");
                            },
                            loading: () {
                              return Loader();
                            },
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return ErrorWidget(error.toString());
                    },
                    loading: () => SizedBox(height: 700, child: Loader()),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
