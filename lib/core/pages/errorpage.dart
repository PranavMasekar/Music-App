import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  ErrorPage({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/connection.jpg"),
          Text(
            errorMessage,
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
