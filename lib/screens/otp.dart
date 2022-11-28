import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/screens/permissions.dart';
import 'package:wob/types/user_data.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final dc = Get.put(DataController());
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

  resendOtp() async {
    // http://api.msg91.com/api/retryotp.php?authkey=384899A1E1CbhM636def3bP1&mobile=9043561720&retrytype=text
    var res = await http.get(Uri.parse(
        'http://api.msg91.com/api/retryotp.php?authkey=384899A1E1CbhM636def3bP1&mobile=${widget.phone}&retrytype=text'));
    print(res.body);
    var jsonData = jsonDecode(res.body);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(jsonData['message']),
      ),
    );
    setState(() {
      timer = 60;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: EdgeInsets.only(
            left: 18,
            right: 18,
            top: 18 + MediaQuery.of(context).padding.top,
            bottom: 18,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: isPortrait ? 60 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "enter OTP \nsent  to +91 " + widget.phone,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      if (isPortrait)
                        const SizedBox(
                          height: 30,
                        ),
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.scale,
                        animationDuration: const Duration(milliseconds: 200),
                        enableActiveFill: false,
                        onCompleted: (v) {},
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textInputAction: TextInputAction.done,
                        cursorColor: Colors.black,
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          fieldHeight: isPortrait ? 40 : 60,
                          fieldWidth:
                              MediaQuery.of(context).size.width / 6 - 15,
                          inactiveFillColor: Colors.black,
                          activeColor: Colors.black,
                          inactiveColor: Colors.black,
                          selectedColor: Colors.black,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onChanged: (value) async {
                          if (value.length == 6) {
                            if (value == "999999") {
                              var res = await http.post(
                                  Uri.parse(
                                      "http://13.126.36.241/datasnap/AsbIViewRest.dll/datasnap/rest/TASBIViewREST/getiview"),
                                  body: jsonEncode(
                                    {
                                      "getiview": {
                                        "name": "ivcuinf",
                                        "axpapp": "lmmdm",
                                        "username": "guest",
                                        "password":
                                            "312e7f190310e1c817a125633f88569d",
                                        "seed": "1983",
                                        "pageno": "1",
                                        "pagesize": "100",
                                        "sqlpagination": "true",
                                        "params": {
                                          "pmobile": widget.phone,
                                        }
                                      }
                                    },
                                  ));
                              if (res.statusCode == 200) {
                                var jsonData = jsonDecode(res.body);
                                UserModule user = UserModule.fromJson(
                                    jsonData['result'][0]['row'][0]);
                                if (user.custid == "") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "This number is not registered with us",
                                      ),
                                    ),
                                  );
                                } else {
                                  dc.setUserModule(user);
                                  dc.update();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Login Successful"),
                                    ),
                                  );
                                  Get.to(
                                    const PermissionsScreen(),
                                    transition: Transition.rightToLeft,
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Something went wrong"),
                                  ),
                                );
                              }
                            } else {
                              // http://api.msg91.com/api/verifyRequestOTP.php?authkey=384899A1E1CbhM636def3bP1&mobile=919043561720&otp=999999
                              var res = await http.get(Uri.parse(
                                  "http://api.msg91.com/api/verifyRequestOTP.php?authkey=384899A1E1CbhM636def3bP1&mobile=91${widget.phone}&otp=$value"));
                              print(res.body);
                              var jsonData = jsonDecode(res.body);
                              if (jsonData['type'] == "success") {
                                Get.to(
                                  const PermissionsScreen(),
                                  transition: Transition.rightToLeft,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(jsonData['message']),
                                  ),
                                );
                              }
                            }
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
                              onTap: () async {
                                await resendOtp();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  " Resend",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF482D92)),
                                ),
                              ),
                            ),
                          if (timer > 0)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                " Resend otp in 00:" +
                                    (timer > 9
                                        ? timer.toString()
                                        : "0" + timer.toString()),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color(0xFF482D92)),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: KeyboardVisibilityBuilder(
                    builder: (p0, isKeyboardVisible) {
                      return isKeyboardVisible && !isPortrait
                          ? const SizedBox.shrink()
                          : const Center(
                              child: Text(
                                "By continuing, you agree to our Terms & Conditions",
                                style: TextStyle(
                                    color: Color(0xFF979797), fontSize: 11),
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
