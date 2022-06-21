import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoC/connectivity bloc/connection_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if (state is ConnectionFailure) return Text("No Internet Connection");
          if (state is ConnectionSuccess)
            return Text("You're Connected to Internet");
          else
            return Text("Not Connected To Internet");
        },
      ),
    );
  }
}
