import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:wob/screens/permissions.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int timer = 60;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (timer > 0) {
          timer--;
        }
      });
      startTimer();
    });
  }

  resendOtp() {
    setState(() {
      timer = 60;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          padding: const EdgeInsets.all(25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "enter OTP \nsent  to +91 " + widget.phone,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              PinCodeTextField(
                appContext: context,
                length: 5,
                obscureText: false,
                animationType: AnimationType.scale,
                animationDuration: const Duration(milliseconds: 200),
                enableActiveFill: false,
                onCompleted: (v) {},
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {
                  Get.to(
                    const PermissionsScreen(),
                    transition: Transition.zoom,
                  );
                },
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 60,
                  fieldWidth: 50,
                  inactiveFillColor: Colors.black,
                  activeColor: Colors.black,
                  inactiveColor: Colors.black,
                  selectedColor: Colors.black,
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(5),
                ),
                onChanged: (value) {
                  if (value.length == 5) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Get.to(const PermissionsScreen());
                    });
                  }
                },
              ),
              Row(
                children: [
                  const Text(
                    "Don't receive secure code?",
                    style: TextStyle(fontSize: 12),
                  ),
                  if (timer == 0)
                    InkWell(
                      onTap: () {
                        resendOtp();
                      },
                      child: const Text(
                        " Resend",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF482D92)),
                      ),
                    ),
                  if (timer > 0)
                    Text(
                      " Resend otp in 00:" +
                          (timer > 9
                              ? timer.toString()
                              : "0" + timer.toString()),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF482D92)),
                    )
                ],
              ),
              const Spacer(),
              const Center(
                child: Text(
                  "By continuing, you agree to our Terms & Conditions",
                  style: TextStyle(color: Color(0xFF979797), fontSize: 11),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
