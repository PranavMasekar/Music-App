import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/Testing%20UI/householder_persona.dart';

import '../main.dart';
import 'Testing BLoC/bloc/drawer_test_bloc.dart';
import 'appbar.dart';

class Personas extends StatelessWidget {
  const Personas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyTestAppBar(),
      ),
      body: BlocBuilder<DrawerTestBloc, DrawerTestState>(
        builder: (context, state) {
          return Stack(
            children: [
              SelectPersona(),
              state.runtimeType == DrawerOpened ? myDrawer() : Container()
            ],
          );
        },
      ),
    );
  }
}

class SelectPersona extends StatelessWidget {
  const SelectPersona({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: Color(0xff1B419B),
              ),
              SizedBox(width: 14),
              Text(
                "Explore Personas",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(height: 27),
          Text(
            "Select a persona that relates you",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff1B419B)),
          ),
          SizedBox(height: 27),
          Row(
            children: [
              personaCard("The Householder", "persona", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HouseHolder(),
                  ),
                );
              }),
              SizedBox(width: 16),
              personaCard("Independent Single", "persona", () {})
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              personaCard("Elder Householder", "persona", () {}),
              SizedBox(width: 16),
              personaCard("The Elder", "persona", () {})
            ],
          ),
        ],
      ),
    );
  }
}

Widget personaCard(String title, String svg, Function ontap) {
  return GestureDetector(
    onTap: () {
      ontap();
    },
    child: Container(
      height: 185,
      width: 156,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: RadialGradient(
          radius: 3,
          colors: [
            Color(0xff1F48A8),
            Color(0xff0B2053),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Spacer(),
          SvgPicture.asset(
            "assets/images/$svg.svg",
            height: 112,
            width: 112,
          )
        ],
      ),
    ),
  );
}
