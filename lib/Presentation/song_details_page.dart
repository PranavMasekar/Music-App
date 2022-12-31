import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Repository/song_repository.dart';

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
                context.read<SongRepository>().getSongNameByID(id),
                style: TextStyle(fontSize: 24),
              ),
              Text(
                "by ${context.read<SongRepository>().getArtistNameByID(id)}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
