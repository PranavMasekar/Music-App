import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/route_names.dart';
import 'package:music_app/view/home.dart';
import 'package:music_app/view/initial.dart';
import 'package:music_app/view/song_details_page.dart';

import 'view/errorpage.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: RouteNames.inital,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: InitialScreen());
        },
      ),
      GoRoute(
        name: RouteNames.home,
        path: '/song',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomeScreen());
        },
        routes: [
          GoRoute(
            name: RouteNames.songDetail,
            path: ':id',
            pageBuilder: (context, state) {
              return MaterialPage(
                child: SongDetails(
                  id: int.parse(state.params["id"]!),
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: RouteNames.error,
        path: '/error',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ErrorPage(errorMessage: state.queryParams["errorMsg"]!),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage(errorMessage: "Wrong route"));
    },
  );
}
