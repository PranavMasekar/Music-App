import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      // body: BlocBuilder<NetworkBloc, NetworkState>(
      //   builder: (context, state) {
      //     if (state is ConnectionSuccess)
      //       return SongsScreen();
      //     else
      //       return ErrorPage(errorMessage: "No Internet Connection");
      //   },
      // ),
    );
  }
}
