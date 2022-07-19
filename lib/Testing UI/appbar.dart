import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'Testing BLoC/bloc/drawer_test_bloc.dart';

class MyTestAppBar extends StatefulWidget {
  MyTestAppBar({Key? key}) : super(key: key);

  @override
  State<MyTestAppBar> createState() => _MyTestAppBarState();
}

class _MyTestAppBarState extends State<MyTestAppBar> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerTestBloc, DrawerTestState>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            "assets/images/Logo.png",
          ),
          actions: [
            Icon(
              Icons.notification_add_outlined,
              size: 24,
              color: Colors.grey,
            ),
            SizedBox(width: 23),
            CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xff1B419B),
            ),
            SizedBox(width: 23),
            GestureDetector(
              onTap: (() {
                if (state is DrawerClosed)
                  BlocProvider.of<DrawerTestBloc>(context)
                      .add(OpenDrawerEvent());
                else
                  BlocProvider.of<DrawerTestBloc>(context)
                      .add(CloseDrawerEvent());
              }),
              child: Icon(
                state.runtimeType == DrawerOpened ? Icons.close : Icons.menu,
                size: 24,
                color: Color(0xff1B419B),
              ),
            ),
            SizedBox(width: 16),
          ],
        );
      },
    );
  }
}
