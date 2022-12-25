import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider =
    StateNotifierProvider<ConnectivityProvider, bool>((ref) {
  return ConnectivityProvider();
});

class ConnectivityProvider extends StateNotifier<bool> {
  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>();

  ConnectivityProvider() : super(false) {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          state = true;
        } else if (state == true) {
          state = false;
        }
      },
    );
  }
}
