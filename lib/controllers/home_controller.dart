import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:music_app/router/routes_name.dart';

class HomeController extends GetxController {
  StreamSubscription? subscription;
  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  Rx<int> connectionType = 0.obs;
  final Connectivity _connectivity = Connectivity();

  Future<void> getConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e);
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    log("changing connection state");
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        update();
        Get.offAllNamed(RoutesName.songScreen);
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        update();
        Get.offAllNamed(RoutesName.songScreen);
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        update();
        Get.offAllNamed(
          RoutesName.errorScreen,
          arguments: "No Internet Connection",
        );
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

  @override
  void onInit() {
    getConnectionType();
    subscription = _connectivity.onConnectivityChanged.listen(_updateState);
    super.onInit();
  }

  // @override
  // void onClose() {
  //   subscription?.cancel();
  //   super.onClose();
  // }
}
