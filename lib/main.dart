import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/router/routes.dart';
import 'package:music_app/router/routes_name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.homeScreen,
      getPages: AppRoutes.routes,
    );
  }
}
