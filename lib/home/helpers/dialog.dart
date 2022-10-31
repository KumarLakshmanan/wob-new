import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/profile/profile.dart';
import 'package:wob/widgets/button.dart';

import '../../constants.dart';

class MainDialog extends StatelessWidget {
  const MainDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: const Color(0xFFF9D3B4),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Get.isDarkMode
                          ? design.dark.secondary
                          : design.light.secondary,
                    ),
                    child: const Icon(Icons.close),
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/rewardpoint.png',
                  height: MediaQuery.of(context).size.width * 0.6,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
              Text(
                "Lorem ipsume\n100 earn reward point",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                "Complete your Profile Your account has been created now. Let's start discovering over 20+ offer in various alcoholic brand.",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black,
                    ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: MaterialBtn(
                  margin: const EdgeInsets.all(0),
                  height: 50,
                  onPressed: () {
                    Get.back();
                    Get.to(
                      const Profile(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  color: Get.isDarkMode
                      ? design.dark.secondary
                      : design.light.secondary,
                  isPrimary: true,
                  text: "Fill the Form",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
