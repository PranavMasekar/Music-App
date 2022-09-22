import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:music_app/controllers/song_controller.dart';
import 'package:music_app/controllers/song_details_controller.dart';
import 'package:music_app/router/routes_name.dart';

class SongsScreen extends GetView<SongController> {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
        backgroundColor: Colors.teal.withOpacity(0.5),
      ),
      body: GetBuilder<SongController>(
        builder: (controller) {
          return controller.songs.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.songs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      style: ListTileStyle.drawer,
                      isThreeLine: false,
                      title: Text(controller.songs[index].songName),
                      subtitle:
                          Text("From ${controller.songs[index].albumName}"),
                      // trailing: Text("By ${controller.songs[index].artistName}"),
                      leading: Image.asset("assets/images/music.png"),
                      onTap: () {
                        Get.lazyPut<SongDetailsController>(
                            () => SongDetailsController());
                        Get.find<SongDetailsController>().setId =
                            controller.songs[index].songId;
                        Get.toNamed(
                          RoutesName.songDetailsScreen,
                          arguments: controller.songs[index].songId,
                        );
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
