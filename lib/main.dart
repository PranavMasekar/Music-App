import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BLoC/connectivity bloc/connection_bloc.dart';
import 'Presentation/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => NetworkBloc()..add(ListenConnection()),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
