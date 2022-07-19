import 'package:flutter/material.dart';

class HouseHolder extends StatelessWidget {
  const HouseHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 38),
          child: Column(
            children: [
              Material(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 68,
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Color(0xffD7D7D7),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      SizedBox(height: 22),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xff1B419B),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "The Householder",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1B419B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The family person - who has financial intentions &   responsibilities towards their family  - whether or not their family is dependent on them.\n\n",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Householders can include\n",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "• Sole earning members\n• Single parents\n• Independent singles who have dependent family.",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 21),
                    Text(
                      "Explore their GoalFi experience",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1B419B),
                      ),
                    ),
                    SizedBox(height: 18),
                    golaFiExperience(
                      "Riya",
                      "Riya is a housewife who believes in saving for emergency.",
                      "",
                      [
                        Color(0xffF66589),
                        Color(0xff8B2D45),
                      ],
                      Color(0xffFFD9E3),
                    ),
                    golaFiExperience(
                      "Tushar",
                      "Tushar owns a startup who wants to plan retirement.",
                      "",
                      [
                        Color(0xffFFD463),
                        Color(0xffC9A036),
                      ],
                      Color(0xffFFF1CD),
                    ),
                    golaFiExperience(
                      "Riya",
                      "Riya is a housewife who believes in saving for emergency.",
                      "",
                      [
                        Color(0xff38D263),
                        Color(0xff1F5E30),
                      ],
                      Color(0xffCCFFDB),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget golaFiExperience(String name, String description, String svg,
    List<Color> list, Color lightColor) {
  return Container(
    height: 105,
    width: 330,
    margin: EdgeInsets.only(bottom: 18),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: lightColor),
    child: Row(
      children: [
        Container(
          width: 105,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: RadialGradient(
              radius: 1,
              colors: list,
            ),
          ),
        ),
        SizedBox(width: 16),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
