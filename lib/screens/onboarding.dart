import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/screens/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
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
                  top: 0,
                  left: 0,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.6,
                            right: 25,
                            bottom: 25,
                            left: 25,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Get best offers in\nall brands",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
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
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.59,
                            right: 25,
                            bottom: 25,
                            left: 25,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Get best offers in\nall brands",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
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
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.59,
                            right: 25,
                            bottom: 25,
                            left: 25,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Get best offers in\nall brands",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
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
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.59,
                            right: 25,
                            bottom: 25,
                            left: 25,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Get best offers in\nall brands",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
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
                      children: [
                        for (int i = 0; i < 4; i++)
                          Expanded(
                            child: Container(
                              height: i == currentPage ? 6 : 2,
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: i == currentPage
                                    ? const Color(0xFFFDDD00)
                                    : const Color(0xFF979797),
                              ),
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
