import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Presentation/errorpage.dart';

import '../BLoC/connectivity bloc/connection_bloc.dart';
import 'songs_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if (state is ConnectionFailure)
            return ErrorPage(errorMessage: "No Internet Connection");
          if (state is ConnectionSuccess)
            return SongsScreen();
          else
            return ErrorPage(errorMessage: "Something Went Wrong");
        },
      ),
    );
  }
}
