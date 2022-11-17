import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wob/screens/otp.dart';

import 'permissions.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool? value = false;
  final phoneControler = TextEditingController();
  Color otpBgColor = const Color(0xFF979797);
  setUpBgColor() {
    setState(() {
      if (phoneControler.text.length == 10) {
        if (value == true) {
          otpBgColor = const Color(0xFF482482);
        } else {
          otpBgColor = const Color(0xFF979797);
        }
      } else {
        otpBgColor = const Color(0xFF979797);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Get.to(
                    const PermissionsScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Color(0xFF482D92),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 40,
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.068, //50
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/flag.png",
                        width: 30,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextField(
                        controller: phoneControler,
                        cursorColor: Colors.black,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          letterSpacing: 2.5,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        onChanged: (value) {
                          setUpBgColor();
                        },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "+91",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          prefixIconColor: Colors.black,
                          prefixIconConstraints: BoxConstraints(minHeight: 17),
                          hintText: "9999999999",
                          hintStyle: TextStyle(
                            color: Color(0xFF979797),
                            letterSpacing: 2.5,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "enter phone number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.11, //80
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xFF482482),
                      checkColor: const Color(0xFFFDDD00),
                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val;
                          setUpBgColor();
                        });
                      },
                    ),
                    const Text(
                      "Accept that you are at legal age to consume alcohol",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.0132, //10
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height * 0.082, //60
                  decoration: BoxDecoration(
                    color: otpBgColor,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Get OTP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                    onTap: () async {
                      if (phoneControler.text.length == 10) {
                        if (value == true) {
                          if(phoneControler.text == "9999999999")
                          {
                            Get.to(
                              OtpScreen(
                                phone: phoneControler.text,
                              ),
                              transition: Transition.zoom
                            );
                          }
                          else
                          {
                            // http://api.msg91.com/api/sendotp.php?authkey=384899A1E1CbhM636def3bP1&mobile=919043561720&sender=SMSIND
                            var res = await http.get(Uri.parse(
                                "http://api.msg91.com/api/sendotp.php?authkey=384899A1E1CbhM636def3bP1&mobile=91${phoneControler.text}&sender=SMSIND"));
                            print(res.body);
                            var data = jsonDecode(res.body);
                            if (data["type"] == "success") {
                              Get.to(
                                OtpScreen(
                                  phone: phoneControler.text,
                                ),
                                transition: Transition.zoom,
                              );
                            }
                          }
                        }
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
