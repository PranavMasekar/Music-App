import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/locator.dart';
import 'package:music_app/router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  setUpLocator();
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://71a314e52d14128ed8c32f4ea822c417@o4505650373066752.ingest.sentry.io/4505650396004352';
        options.tracesSampleRate = 0.5;
        options.tracesSampler = (samplingContext) {
          return 0.5;
        };
      },
      appRunner: () => runApp(ProviderScope(child: MyApp())),
    );
  } else {
    runApp(ProviderScope(child: MyApp()));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: locator.get<AppRouter>().router,
    );
  }
}
