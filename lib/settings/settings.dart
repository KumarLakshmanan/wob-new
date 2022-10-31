import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wob/constants.dart';
import 'package:wob/controller/navigation.dart';
import 'package:wob/main/mainscreen.dart';
import 'package:wob/profile/helpers/profile_field.dart';
import 'package:wob/widgets/button.dart';

import '../controller/data_controller.dart';
import 'helpers/expansion.dart';
import 'helpers/settingstile.dart';
import 'helpers/switchbuilder.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool securityExpanded = false;
  bool notificationsExpanded = false;
  bool faceIdisOn = true;
  bool notificationsOn = true;
  bool vibrateOn = true;
  final nc = Get.find<NController>();
  final dc = Get.find<DataController>();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController emptyReqController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setUpCounts();
    distanceController.addListener(() async {
      if (distanceController.text.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('distance', int.parse(distanceController.text));
      }
    });
    emptyReqController.addListener(() async {
      if (emptyReqController.text.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('emptyReq', int.parse(emptyReqController.text));
      }
    });
  }

  setUpCounts() async {
    final prefs = await SharedPreferences.getInstance();
    final distance = prefs.getInt('distance') ?? 30;
    final emptyReq = prefs.getInt('emptyReq') ?? 20;
    setState(() {
      distanceController.text = distance.toString();
      emptyReqController.text = emptyReq.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor:
              Get.isDarkMode ? design.dark.secondary : design.light.secondary,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                nc.currentPage = 0;
                nc.pageController.animateToPage(0,
                    duration: animationDuration, curve: Curves.easeInOut);
                nc.update();
              }),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            const SettingsTile(
              title: "My Transaction",
            ),
            const SettingsTile(
              title: "Active Offer",
            ),
            MyExpansionPanel(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4),
                    child: Divider(
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  SwitchBuilder(
                    isOn: faceIdisOn,
                    title: "Face ID",
                    onToggle: (bool value) {
                      setState(() {
                        faceIdisOn = value;
                      });
                    },
                  ),
                ],
              ),
              title: "Security & Privacy",
            ),
            MyExpansionPanel(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4),
                    child: Divider(
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  SwitchBuilder(
                    isOn: notificationsOn,
                    title: "On/Off Notification",
                    onToggle: (bool value) {
                      setState(() {
                        notificationsOn = value;
                      });
                    },
                  ),
                  SwitchBuilder(
                    isOn: vibrateOn,
                    title: "Enable App Vibration",
                    onToggle: (bool value) {
                      setState(() {
                        vibrateOn = value;
                      });
                    },
                  ),
                ],
              ),
              title: "Notification Settings",
            ),
            Container(
              height: 50.0,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 16,
                  ),
                ],
                color: Get.isDarkMode
                    ? design.dark.background2
                    : design.light.background2,
              ),
              child: SwitchBuilder(
                isOn: Get.isDarkMode,
                title: "Dark Mode",
                onToggle: (bool value) {
                  dc.saveThemeStatus(value);
                },
              ),
            ),
            const SettingsTile(
              title: "Terms & Services",
            ),
            const SettingsTile(
              title: "Privacy Policy",
            ),
            const SettingsTile(
              title: "Contact Us",
            ),
            ProfileField(
              title: 'Distance',
              controller: distanceController,
              isPhone: true,
            ),
            ProfileField(
              title: 'Out of Range Count',
              controller: emptyReqController,
              isPhone: true,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MaterialBtn(
                onPressed: () {
                  Get.offAll(
                    const MainScreen(),
                    transition: Transition.rightToLeft,
                  );
                  nc.isLogout();
                },
                isBorder: false,
                color: Get.isDarkMode ? design.dark.secondary : Colors.white,
                height: 50,
                child: Text(
                  "Log Out",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Get.isDarkMode ? Colors.white : Colors.pink[400],
                      ),
                ),
                isPrimary: true,
                isShadow: true,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MaterialBtn(
                onPressed: () {},
                color: Get.isDarkMode ? design.dark.secondary : Colors.white,
                isBorder: false,
                height: 50,
                child: Text(
                  "Delete Account",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Get.isDarkMode
                            ? Colors.white
                            : design.light.secondary,
                      ),
                ),
                isPrimary: true,
                isShadow: true,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                "assets/images/splash.png",
                width: MediaQuery.of(context).size.width * 0.4,
                color: Get.isDarkMode ? Colors.white : null,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
