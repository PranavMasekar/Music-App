import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BLoC/connectivity bloc/connection_bloc.dart';
import 'BLoC/song bloc/song_bloc.dart';
import 'Presentation/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => NetworkBloc()),
        ),
        BlocProvider(
          create: ((context) => SongBloc()..add(GetSongs(songs: []))),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: HomeScreen()),
      ),
    );
  }
}
