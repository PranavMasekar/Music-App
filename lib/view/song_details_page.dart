import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:music_app/controllers/song_details_controller.dart';

class SongDetails extends GetView<SongDetailsController> {
  final int id;
  SongDetails({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: controller.isLoading.value
          ? CircularProgressIndicator()
          : SingleChildScrollView(
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
                      controller.song!.songName,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      "by ${controller.song!.artistName}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Lyrics",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Text(controller.lyric!.lyrics
                        .substring(0, controller.lyric!.lyrics.indexOf("***"))),
                  ],
                ),
              ),
            ),
    );
  }
}
