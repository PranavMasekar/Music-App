import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';
import 'Testing BLoC/bloc/drawer_test_bloc.dart';
import 'appbar.dart';

class KYC extends StatelessWidget {
  const KYC({Key? key}) : super(key: key);

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
              OnBoarding(),
              state.runtimeType == DrawerOpened ? myDrawer() : Container()
            ],
          );
        },
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

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
                "KYC / Onboarding",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(height: 30),
          statusCard(),
          SizedBox(height: 30),
          kycOptionCard(),
        ],
      ),
    );
  }
}

Widget statusCard() {
  return Container(
    height: 181,
    width: 330,
    padding: EdgeInsets.all(13),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Color(0xff1B419B),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Your KYC Verification Status",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Spacer(),
            Icon(Icons.cancel_outlined, color: Colors.white)
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60, width: 60),
            SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    "Your KYC Verification is incomplete, complete the verification.",
                    style: TextStyle(
                        overflow: TextOverflow.clip,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffF5CB5C)),
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 27,
                    width: 157,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        "Click Here to Complete",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 16),
        Text(
          "• Your Aadhaar KYC Verification is incomplete",
          style: TextStyle(
              color: Color(0xffF5CB5C),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 4),
        Text(
          "• Your PAN KYC Verification is incomplete",
          style: TextStyle(
              color: Color(0xffF5CB5C),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

Widget kycOptionCard() {
  return Stack(
    children: [
      Container(
        height: 90,
        width: 328,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xff00ABC8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 33, width: 45),
            SizedBox(width: 27),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aadhaar Card",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 224,
                  child: Text(
                    "Lorem ipsum dolor amet, consectetur Eros augue velit cursus tincidunt lacus,nec.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Positioned(
        right: 0,
        child: Container(
          height: 24,
          width: 85,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xff2B9348),
          ),
          child: Row(
            children: [
              Text(
                "Verified",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Icon(
                Icons.check_box_outlined,
                color: Colors.white,
                size: 15,
              )
            ],
          ),
        ),
      )
    ],
  );
}
