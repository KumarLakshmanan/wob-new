import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';
import 'package:wob/detect/map_screen.dart';
import 'package:wob/widgets/button.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            size: 20,
          ),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/illustration.png',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Get.isDarkMode ? Colors.black.withOpacity(0.6) : null,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Congratulations!',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Get.isDarkMode
                              ? design.dark.textcolor
                              : const Color(0xFF619367),
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your account has been created now.\nLet\'s start discovering over 20+ offer \nin various alcoholic brand.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Get.isDarkMode
                              ? design.dark.textcolor.withOpacity(0.5)
                              : design.light.textcolor.withOpacity(0.5),
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: MaterialBtn(
              onPressed: () {
                Get.offAll(
                  const GoogleMapScreen(),
                  transition: Transition.rightToLeft,
                );
              },
              color: Get.isDarkMode
                  ? design.dark.secondary
                  : design.light.secondary,
              height: 50,
              isPrimary: true,
              text: "Let's Go",
            ),
            bottom: 15,
            left: 15,
            right: 15,
          ),
        ],
      ),
    );
  }
}
