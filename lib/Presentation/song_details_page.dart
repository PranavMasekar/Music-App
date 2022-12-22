import 'package:flutter/material.dart';

class SongDetails extends StatelessWidget {
  final int id;
  SongDetails({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Image.asset(
                "assets/images/play.jpg",
              ),
              Text(
                "state.song!.songName",
                style: TextStyle(fontSize: 24),
              ),
              Text(
                "by ",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                "Lyrics",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                "state.lyric!.lyrics".substring(
                  0,
                  "state.lyric!.lyrics".indexOf("***"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
