import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/bloc/connectivity%20bloc/connection_bloc.dart';
import 'package:music_app/locator.dart';
import 'BLoC/song bloc/song_bloc.dart';
import 'Presentation/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
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
