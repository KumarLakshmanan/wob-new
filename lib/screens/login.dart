import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/screens/otp.dart';
import 'package:wob/screens/permissions.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool? value = false;
  final phoneControler = TextEditingController();
  Color otpBgColor = Color(0xFF979797);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25), //25
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.4,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 40,
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.068, //50
                child: Row(
                  children: [
                    Image.asset("assets/flag.png"),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextField(
                        controller: phoneControler,
                        cursorColor: Colors.black,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Text(
                            "+91 ",
                            style: TextStyle(fontSize: 16),
                          ),
                          prefixIconColor: Colors.black,
                          prefixIconConstraints: BoxConstraints(minHeight: 17),
                          hintText: "9 9 9 9 9 9 9 9 9 9",
                          hintStyle: TextStyle(
                            color: Color(0xFF979797),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  "Enter Phone Number",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.11, //80
                child: Row(
                  children: [
                    Checkbox(
                        activeColor: Color(0xFF482482),
                        checkColor: Color(0xFFFDDD00),
                        value: value,
                        onChanged: (val) {
                          setState(() {
                            value = val;
                            otpBgColor =
                                val! ? Color(0xFF482482) : Color(0xFF979797);
                          });
                        }),
                    Text(
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
                      children: [
                        Text(
                          "get OTP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
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
                    onTap: () {
                      print(MediaQuery.of(context).size.height);
                      // Get.to(PermissionsScreen(),);
                      Get.to(
                        OtpScreen(),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),

        //   ],
        // ),
      ),
    );
  }
}
