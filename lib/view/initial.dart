import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/view/errorpage.dart';
import 'package:music_app/view/home.dart';

import '../controllers/connectivity_controller.dart';

class InitialScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(connectivityProvider)
          ? HomeScreen()
          : ErrorPage(errorMessage: "No internet connection"),
    );
  }
}
