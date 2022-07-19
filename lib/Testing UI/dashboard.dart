import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Testing BLoC/bloc/carousel_bloc.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => CarouselBloc(),
        child: Scaffold(
          body: BlocBuilder<CarouselBloc, CarouselState>(
            builder: (context, state) {
              if (state is CarouselChangedState) activeIndex = state.index;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 9),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dashboard",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 18),
                          welcomeCard(),
                          SizedBox(height: 36),
                          Text(
                            "Plan your finances with ease",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          CarouselSlider(
                            items: [
                              Align(
                                alignment: Alignment(-12, 0),
                                child: planCard(
                                  "Investment Planning",
                                  "Lorem ipsum dolor sit amet, onectetur adipi scing elit. V orsan felis. Risushe ndrerit enim.",
                                  Color(0xff8681C9),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-12, 0),
                                child: planCard(
                                  "Tax",
                                  "Lorem ipsum dolor sit amet, onectetur adipi scing elit. V orsan felis. Risushe ndrerit enim.",
                                  Color(0xffDE5476),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-12, 0),
                                child: planCard(
                                  "Tax",
                                  "Lorem ipsum dolor sit amet, onectetur adipi scing elit. V orsan felis. Risushe ndrerit enim.",
                                  Color(0xffDE5476),
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 155,
                              enableInfiniteScroll: false,
                              pageSnapping: false,
                              onPageChanged: (index, _) {
                                BlocProvider.of<CarouselBloc>(context)
                                    .add(ChangeCoursel(index: index));
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: AnimatedSmoothIndicator(
                              activeIndex: activeIndex,
                              count: 3,
                              effect: ExpandingDotsEffect(
                                dotHeight: 4,
                                dotWidth: 4,
                                activeDotColor: Color(0xff1B419B),
                                dotColor: Color(0xffB7B7B7),
                              ),
                            ),
                          ),
                          SizedBox(height: 36),
                          Text(
                            "Highlights",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              highlightCard("KYC", "Lorem ipsum", "Update Now",
                                  Color(0xffDE5476), () {}),
                              highlightCard("Risk Profile", "Lorem ipsum",
                                  "Check Now", Color(0xff4BBEA0), () {}),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              highlightCard("Assets & Liability", "Lorem ipsum",
                                  "View more", Color(0xff00ABC8), () {}),
                              highlightCard("Expenses", "Lorem ipsum",
                                  "Track Now", Color(0xff9792E3), () {}),
                            ],
                          ),
                          SizedBox(height: 40),
                          exploreCard(),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget welcomeCard() {
  return Container(
    height: 140,
    width: 330,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/images/dashboard.svg",
              height: 94,
            ),
            // Image.asset(
            //   "assets/images/music.png",
            //   height: 94,
            // ),
            SizedBox(
              width: 16,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hi Jones \n\n",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff1B419B),
                    ),
                  ),
                  TextSpan(
                    text: "Welcome to ",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: "GoalFi \n\n",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text:
                        "Lorem ipsum dolor sit amet, ectetur\nadipiscing elit. Lorem in puattis leosit p\nmi ullamcorper erat curabitur.",
                    style: TextStyle(
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget planCard(String title, String description, Color color) {
  return Container(
    height: 155,
    width: 245,
    margin: EdgeInsets.only(right: 13),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        SizedBox(height: 20),
        Container(
          height: 30,
          width: 86,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              "PLAN NOW",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget highlightCard(String title, String description, String buttonText,
    Color color, Function ontap) {
  return Container(
    height: 115,
    width: 156,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        SizedBox(height: 12),
        InkWell(
          onTap: () {
            ontap();
          },
          child: Container(
            height: 30,
            width: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget exploreCard() {
  return Container(
    height: 166,
    width: 330,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Color(0xff151515),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.compass_calibration_rounded,
          size: 20,
          color: Colors.blue,
        ),
        SizedBox(width: 23),
        SizedBox(
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                'Explore GoalFiClub',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                gradient: goldenGradient,
              ),
              SizedBox(height: 8),
              Text(
                "Lorem ipsum dolor sit amet, onectetur adipi scing elit. V orsan felis. Risushe ndrerit enim.",
                style: TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 17),
              GradientText(
                'Get unlimited benefits',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                gradient: goldenGradient,
              ),
              SizedBox(height: 5),
              Text(
                "Learn more >",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// *********************************************** Gradient ***************************************** //
LinearGradient goldenGradient = LinearGradient(colors: [
  Color(0xffF8E097),
  Color(0xffC4A65B),
  Color(0xffF8E097),
  Color(0xffC4A65B),
  Color(0xffF8E097),
]);

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
