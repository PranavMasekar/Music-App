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
    );
  }
}
