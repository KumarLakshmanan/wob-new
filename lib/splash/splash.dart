import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/explore/explore_offer.dart';
import 'package:wob/functions.dart';
import 'package:wob/home/helpers/dialog.dart';
import 'package:wob/main/mainscreen.dart';
import 'package:wob/screens/onboarding.dart';

class Splash extends StatefulWidget {
  final bool isLogOut;
  final String? msg;
  const Splash({Key? key, this.isLogOut = false, this.msg}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _width = 0;
  final dc = Get.put(DataController());
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  Future _checkLogin() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      var isPortrait =
          MediaQuery.of(context).orientation == Orientation.portrait;
      _width = isPortrait
          ? MediaQuery.of(context).size.width * 0.8
          : MediaQuery.of(context).size.width * 0.4;
    });
    await Future.delayed(const Duration(seconds: 2));
    // var res = await http.post(
    //     Uri.parse(
    //         "http://13.126.36.241/datasnap/ASBMenuRest.dll/datasnap/rest/TASBMenuREST/login"),
    //     body: jsonEncode({
    //       "login": {
    //         "axpapp": "lmmdm",
    //         "username": "guest",
    //         "password": "312e7f190310e1c817a125633f88569d",
    //         "seed": "1983",
    //         "other": "chrome",
    //         "trace": "true"
    //       }
    //     }));
    // print(res.body);
    // String sessionId = jsonDecode(res.body)["result"][0]["result"]['s'];
    // print(sessionId);
    // await checkPermissions(() async {
    // final prefs = await SharedPreferences.getInstance();
    // print(prefs.getInt("distance"));
    // print(prefs.getInt("emptyReq"));`
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userModule") != null) {
      await loadData();
      Get.to(
        // const MainScreen(),
        const ExploreOffers(),
        transition: Transition.rightToLeft,
      );
    } else {
      Get.to(
        const OnboardingScreen(),
        transition: Transition.rightToLeft,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          alignment: Alignment.center,
          width: _width,
          child: Center(
            child: Image.asset(
              "assets/images/splash.png",
              fit: BoxFit.fill,
              color: Get.isDarkMode ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
