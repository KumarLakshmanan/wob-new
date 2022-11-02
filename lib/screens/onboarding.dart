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
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.1,
                  right: 0,
                  child: Image.asset("assets/images/Group40.png"),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.3,
                  left: MediaQuery.of(context).size.width * 0.14,
                  child: Image.asset("assets/images/Subtract.png"),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.43,
                  left: 0,
                  child: Image.asset("assets/images/Ellipse.png"),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.32,
                  right: 0,
                  child: Image.asset("assets/images/image.png"),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.59,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Get best offers in\nall brands",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Everyone is welcome.Everyone has\nsomething to give.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.263,
                  bottom: MediaQuery.of(context).size.width * 0.364,
                  child: Image.asset("assets/images/Subtract2.png"),
                ),
                Positioned(
                  bottom: -MediaQuery.of(context).size.width * 0.8,
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.05),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFAAB1B),
                        shape: BoxShape.circle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Gilroy",
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Get.to(
                        const LogInScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                ),
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
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 5,
                            thickness: 3,
                            color: Color(0xFF979797),
                            endIndent: 6,
                            indent: 6,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 5,
                            thickness: 3,
                            color: Color(0xFF979797),
                            endIndent: 6,
                            indent: 6,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 5,
                            thickness: 3,
                            color: Color(0xFF979797),
                            endIndent: 6,
                            indent: 6,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 6,
                            height: 5,
                            thickness: 3,
                            color: Color(0xFF979797),
                            endIndent: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
