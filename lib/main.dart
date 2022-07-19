import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Testing%20UI/dashboard.dart';

import 'Testing UI/Testing BLoC/bloc/drawer_test_bloc.dart';
import 'Testing UI/appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerTestBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyTestAppBar(),
          ),
          body: BlocBuilder<DrawerTestBloc, DrawerTestState>(
            builder: (context, state) {
              return Stack(
                children: [
                  DashBoard(),
                  state.runtimeType == DrawerOpened ? myDrawer() : Container()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// Widget myDrawer() {
//   return
// }

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xff151515).withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: 320,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            buildOptions("Dashboard", Icons.person, () {}),
            buildOptions("KYC / Onboarding", Icons.person, () {}),
            buildOptions("Asset & Liability", Icons.person, () {}),
            buildOptions("Expense Tracker", Icons.person, () {}),
            buildOptions("Investment Planning", Icons.person, () {}),
            buildOptions("Tax Planning", Icons.person, () {}),
            buildOptions("Insurance Planning", Icons.home, () {}),
            buildOptions("Estate Planning", Icons.person, () {}),
            buildOptions("Reporting", Icons.book, () {}),
            buildOptions("Settings", Icons.settings, () {}),
            buildOptions("Subscription", Icons.person, () {}),
            buildOptions("Help", Icons.help, () {}),
          ],
        ),
      ),
    );
  }
}

Widget buildOptions(String title, IconData icon, Function ontap) {
  return Column(
    children: [
      Row(
        children: [
          Icon(
            icon,
            color: Color(0xff1B419B),
          ),
          SizedBox(width: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
      SizedBox(height: 5),
      Divider(),
      SizedBox(height: 5),
    ],
  );
}
// *********************************************************************************************************************** //

class AnimatedPageIndicatorFb1 extends StatelessWidget {
  const AnimatedPageIndicatorFb1(
      {Key? key,
      required this.currentPage,
      required this.numPages,
      this.dotHeight = 10,
      this.activeDotHeight = 10,
      this.dotWidth = 10,
      this.activeDotWidth = 20,
      this.gradient =
          const LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)]),
      this.activeGradient =
          const LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)])})
      : super(key: key);

  final int
      currentPage; //the index of the active dot, i.e. the index of the page you're on
  final int
      numPages; //the total number of dots, i.e. the number of pages your displaying

  final double dotWidth; //the width of all non-active dots
  final double activeDotWidth; //the width of the active dot
  final double activeDotHeight; //the height of the active dot
  final double dotHeight; //the height of all dots
  final Gradient gradient; //the gradient of all non-active dots
  final Gradient activeGradient; //the gradient of the active dot

  double _calcRowSize() {
    //Calculates the size of the outer row that creates spacing that is equivalent to the width of a dot
    final int widthFactor = 2; //assuming spacing is equal to the width of a dot
    return (dotWidth * numPages * widthFactor) + activeDotWidth - dotWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _calcRowSize(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          numPages,
          (index) => AnimatedPageIndicatorDot(
            isActive: currentPage == index,
            gradient: gradient,
            activeGradient: activeGradient,
            activeWidth: activeDotWidth,
            activeHeight: activeDotHeight,
          ),
        ),
      ),
    );
  }
}

class AnimatedPageIndicatorDot extends StatelessWidget {
  const AnimatedPageIndicatorDot(
      {Key? key,
      required this.isActive,
      this.height = 10,
      this.width = 10,
      this.activeWidth = 20,
      this.activeHeight = 10,
      required this.gradient,
      required this.activeGradient})
      : super(key: key);

  final bool isActive;
  final double height;
  final double width;
  final double activeWidth;
  final double activeHeight;
  final Gradient gradient;
  final Gradient activeGradient;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? activeWidth : width,
      height: isActive ? activeHeight : height,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          gradient: isActive ? activeGradient : gradient,
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }
}
