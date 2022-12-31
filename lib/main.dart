import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Repository/song_repository.dart';

import 'BLoC/song bloc/song_bloc.dart';
import 'Presentation/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => SongRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: ((context) =>
                SongBloc(songRepository: context.read<SongRepository>())
                  ..add(GetSongs())),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: HomeScreen()),
        ),
      ),
    );
  }
}
