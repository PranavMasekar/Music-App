import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  String errorMessage = "";
  ErrorPage({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music App"),
      ),
      body: Center(
        child: Text(errorMessage),
      ),
    );
  }
}
