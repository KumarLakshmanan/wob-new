import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/screens/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF482D92),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Positioned(
                  top: MediaQuery.of(context).size.width * 0.1,
                  right: 0,
                  child: Image.asset("assets/Group40.png")),
              Positioned(
                  top: MediaQuery.of(context).size.width * 0.3,
                  left: MediaQuery.of(context).size.width * 0.14,
                  child: Image.asset("assets/Subtract.png")),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.43,
                  left: 0,
                  child: Image.asset("assets/Ellipse.png")),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.32,
                  right: 0,
                  child: Image.asset("assets/image.png")),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.59,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get best offers in",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text(
                        "all brands",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Everyone is welcome.Everyone has",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "something to give.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: MediaQuery.of(context).size.width * 0.263, //90
                  bottom: MediaQuery.of(context).size.width * 0.364, //125
                  child: Image.asset("assets/Subtract2.png")),
              Positioned(
                  bottom: MediaQuery.of(context).size.width * 0.072, //25

                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                        child: Text(
                          "getstarted",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: (() {
                          print(MediaQuery.of(context).size.width);
                          Get.offAll(LogInScreen());
                        })),
                  )),
              Positioned(
                  bottom: 90,
                  child: Container(
                    padding: const EdgeInsets.only(right: 18, left: 18),
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Row(
                      children: const [
                        Expanded(
                            child: Divider(
                          height: 5,
                          thickness: 5,
                          color: Color(0xFFFDDD00),
                          endIndent: 6,
                          indent: 6,
                        )),
                        Expanded(
                            child: Divider(
                          height: 5,
                          thickness: 3,
                          color: Color(0xFF979797),
                          endIndent: 6,
                          indent: 6,
                        )),
                        Expanded(
                            child: Divider(
                          height: 5,
                          thickness: 3,
                          color: Color(0xFF979797),
                          endIndent: 6,
                          indent: 6,
                        )),
                        Expanded(
                            child: Divider(
                          height: 5,
                          thickness: 3,
                          color: Color(0xFF979797),
                          endIndent: 6,
                          indent: 6,
                        )),
                        Expanded(
                            child: Divider(
                          indent: 6,
                          height: 5,
                          thickness: 3,
                          color: Color(0xFF979797),
                          endIndent: 6,
                        )),
                      ],
                    ),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
