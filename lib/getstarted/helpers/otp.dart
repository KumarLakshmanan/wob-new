import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wob/onboarding/welcome.dart';
import 'package:wob/widgets/button.dart';

import '../../constants.dart';

class Otp extends StatefulWidget {
  final TextEditingController phoneController;
  final PageController pageController;
  const Otp({
    Key? key,
    required this.phoneController,
    required this.pageController,
  }) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  StreamController<ErrorAnimationType>? errorController;
  String otp = "";
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    super.dispose();
    errorController!.close();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 15,
        bottom: 10,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Enter your verification code",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Enter the 4-digit code we have sent to \n+91 ${widget.phoneController.text}",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 15,
          ),
          PinCodeTextField(
            focusNode: focusNode,
            appContext: context,
            length: 4,
            obscureText: false,
            animationType: AnimationType.scale,
            animationDuration: const Duration(milliseconds: 200),
            enableActiveFill: true,
            keyboardType: TextInputType.number,
            hintCharacter: "-",
            hintStyle: TextStyle(
              color: Get.isDarkMode
                  ? design.dark.secondary
                  : design.light.secondary,
              fontWeight: FontWeight.w300,
            ),
            cursorHeight: 20,
            cursorWidth: 1,
            cursorColor: Colors.grey,
            textStyle: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                ),
            autoFocus: true,
            onCompleted: (v) {
              verifyOtp();
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              fieldHeight: 40,
              fieldWidth: MediaQuery.of(context).size.width * 0.2,
              activeFillColor: Get.isDarkMode
                  ? design.dark.fieldColor
                  : design.light.fieldColor,
              inactiveFillColor: Get.isDarkMode
                  ? design.dark.fieldColor
                  : design.light.fieldColor,
              activeColor: Get.isDarkMode
                  ? design.dark.fieldColor
                  : design.light.fieldColor,
              inactiveColor: Get.isDarkMode
                  ? design.dark.fieldColor
                  : design.light.fieldColor,
              selectedColor: Get.isDarkMode
                  ? design.dark.fieldColor
                  : design.light.fieldColor,
              selectedFillColor: Get.isDarkMode
                  ? design.dark.fieldColor
                  : design.light.fieldColor,
              errorBorderColor: design.dark.primary,
              borderWidth: 1,
              borderRadius: BorderRadius.circular(5),
            ),
            errorAnimationController: errorController,
            onChanged: (value) {
              setState(() {
                otp = value;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialBtn(
            onPressed: () async {
              verifyOtp();
            },
            text: "Verify",
            color:
                Get.isDarkMode ? design.dark.secondary : design.light.secondary,
            margin: const EdgeInsets.only(),
            isPrimary: true,
            height: 50,
          ),
        ],
      ),
    );
  }

  verifyOtp() async {
    if (otp == "1234") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);
      print("Logged in");
      Get.to(
        const Welcome(),
        transition: Transition.rightToLeft,
      );
    } else {
      errorController!.add(ErrorAnimationType.shake);
    }
  }
}
