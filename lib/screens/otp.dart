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
                "Enter OTP\nSent to +91 " + widget.phone,
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
                children: const [
                  Text(
                    "Don't receive secure code?",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    " Resent otp in 00:49",
                    style:
                        TextStyle(fontSize: 12, color: const Color(0xFF482D92)),
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
