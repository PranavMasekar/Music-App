import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'BLoC/connectivity bloc/connection_bloc.dart';
import 'BLoC/song bloc/song_bloc.dart';
import 'Presentation/home.dart';

void main() {
  runApp(MyApp());
}

void getLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  print("Altitide ${position.altitude} \n");
  print("Latitude ${position.latitude} \n");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getLocation();
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
