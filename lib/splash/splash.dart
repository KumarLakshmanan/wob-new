import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/controller/data_controller.dart';
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
      _width = MediaQuery.of(context).size.width * 0.7;
    });
    await Future.delayed(const Duration(seconds: 2));
    Map<String, dynamic> storeDetails = {};
    // var res = await http.get(Uri.parse("http://nirals.eduniv.in/wob.json"));
    // storeDetails = json.decode(res.body);
    // dc.setStoreDetails(storeDetails);
    await checkPermissions(() async {
      // final prefs = await SharedPreferences.getInstance();
      // print(prefs.getInt("distance"));
      // print(prefs.getInt("emptyReq"));
      Get.to(
        // const MainScreen(),
        const OnboardingScreen(),
        transition: Transition.rightToLeft,
      );
    });
  }

  Future checkPermissions(Function onTap) async {
    // if (kIsWeb) {
    onTap();
    // } else {
    //   try {
    //     var status = await Permission.location.request();
    //     if (status.isGranted) {
    //       Location location = Location();
    //       bool serviceEnabled = await location.serviceEnabled();
    //       if (!serviceEnabled) {
    //         serviceEnabled = await location.requestService();
    //         if (!serviceEnabled) {
    //           serviceEnabled = await location.requestService();
    //           if (!serviceEnabled) {
    //             debugPrint('Location Denied once');
    //           }
    //         }
    //       }
    //       onTap();
    //     } else if (status.isDenied) {
    //       checkPermissions(onTap);
    //     } else if (status.isPermanentlyDenied) {
    //       openAppSettings();
    //     }
    //   } on PlatformException catch (e) {
    //     print(e);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
