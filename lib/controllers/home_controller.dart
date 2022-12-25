import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/locator.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/route_names.dart';
import 'package:music_app/services/song_service.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, bool>((ref) {
  return locator.get<HomeController>();
});

class HomeController extends StateNotifier<bool> {
  final SongService _service;
  HomeController({required SongService songService})
      : _service = songService,
        super(true);
  List<Song> allSongs = [];

  Future loadSongs(BuildContext context) async {
    final response = await _service.getSongs();
    state = false;
    response.fold(
      (l) {
        context.goNamed(RouteNames.error, queryParams: {"errorMsg": l});
      },
      (r) {
        Map<String, dynamic> res = jsonDecode(r.data);
        for (var element in res["message"]["body"]["track_list"]) {
          allSongs.add(Song.fromJson(element["track"]));
        }
      },
    );
  }
}
