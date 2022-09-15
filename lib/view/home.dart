import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:music_app/controllers/home_controller.dart';
import 'package:music_app/view/songs_screen.dart';
import 'errorpage.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Music App"),
            backgroundColor: Colors.teal.withOpacity(0.5),
          ),
          body: controller.connectionType.value == 0
              ? ErrorPage(errorMessage: "No Internet Connection")
              : SongsScreen(),
        );
      },
    );
  }
}
